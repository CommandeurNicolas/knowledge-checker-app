import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uidUser;
  DatabaseService({this.uidUser});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  final CollectionReference teacherCollection =
      Firestore.instance.collection('teachers');
  final CollectionReference sectionCollection =
      Firestore.instance.collection('sections');
  final CollectionReference classCollection =
      Firestore.instance.collection('classes');

  Future getSectionsClasses(String classe) async {
    var documentData = await classCollection
        .document(classe)
        .collection("sections")
        .getDocuments();
    var documents = documentData.documents;

    Map<String, Map<String, Object>> sectionResult = {};
    for (var doc in documents) {
      sectionResult[doc.data['title']] = doc.data;
    }
    for (var section in sectionResult.keys) {
      var skillDataDocument = await classCollection
          .document(classe)
          .collection("sections")
          .document(section)
          .collection('skills')
          .getDocuments();
      var skillDocuments = skillDataDocument.documents;
      List<Map<String, Object>> arraySkillList = [];
      for (var skilldoc in skillDocuments) {
        Map<String, Object> listSkill = {};
        listSkill['title'] = skilldoc.data['title'];
        listSkill['description'] = skilldoc.data['description'];
        arraySkillList.add(listSkill);
      }
      sectionResult[section]["skills"] = arraySkillList;
    }

    return sectionResult;
  }

  /// Function that will create in the appropriate record in documents `teachers` or `users`.
  ///
  /// Information given :
  /// * [email]: String
  /// * [username]: String
  /// * [password] : String
  /// * [classe]: String
  /// * [isTeacher]: bool
  Future registerUserData(String email, String username, String password,
      String classe, bool isTeacher) async {
    if (!isTeacher) {
      await classCollection
          .document(classe)
          .updateData({"number": FieldValue.increment(1)});
      var sections = await getSectionsClasses(classe);
      await userCollection.document(uidUser).setData({
        'uid': uidUser,
        'email': email,
        'username': username,
        'password': password,
        'class': classe,
        'teacher': false
      });
      for (var sectionKey in sections.keys) {
        await userCollection
            .document(uidUser)
            .collection("sections")
            .document(sectionKey)
            .setData({
          "description": sections[sectionKey]['description'],
          "title": sections[sectionKey]['title'],
        });
        for (var skill in sections[sectionKey]["skills"]) {
          await userCollection
              .document(uidUser)
              .collection("sections")
              .document(sectionKey)
              .collection("skills")
              .document(skill['title'])
              .setData({
            "title": skill['title'],
            "description": skill['description'],
            "selfValidated": false,
            "validated": false,
          });
        }
      }
    } else {
      var sections = await getSectionsClasses(classe);
      await teacherCollection.document(uidUser).setData({
        'uid': uidUser,
        'email': email,
        'username': username,
        'password': password,
        'class': classe,
        'teacher': true
      });
      for (var sectionKey in sections.keys) {
        await teacherCollection
            .document(uidUser)
            .collection("sections")
            .document(sectionKey)
            .setData({
          "description": sections[sectionKey]['description'],
          "title": sections[sectionKey]['title'],
        });
        for (var skill in sections[sectionKey]["skills"]) {
          await teacherCollection
              .document(uidUser)
              .collection("sections")
              .document(sectionKey)
              .collection("skills")
              .document(skill['title'])
              .setData({
            "title": skill['title'],
            "description": skill['description'],
            "selfValidated": false,
            "validated": false,
          });
        }
      }
    }
  }

  Stream<QuerySnapshot> get classes {
    return classCollection.snapshots();
  }

  Future getEmailByUsername(String username) async {
    QuerySnapshot documentData = await teacherCollection
        .where("username", isEqualTo: username)
        .getDocuments();
    if (documentData.documents.isEmpty) {
      documentData = await userCollection
          .where("username", isEqualTo: username)
          .getDocuments();
    }

    return documentData.documents.isEmpty
        ? null
        : documentData.documents[0].data['email'];
  }

  Future insertNewSection(String classe, String title, String description,
      String skillTitle, String skillDescription) async {
    ///AJOUT DANS LA CLASSE LA SECTION
    await classCollection
        .document(classe)
        .collection("sections")
        .document(title)
        .setData({"title": title, "description": description});

    ///AJOUT DANS LA SECTION DE LA CLASSE LE 1er SKILLS
    await classCollection
        .document(classe)
        .collection("sections")
        .document(title)
        .collection("skills")
        .document(skillTitle)
        .setData({"title": skillTitle, "description": skillDescription});

    /// RECUPERATION UTILISATEUR DE LA LISTE
    List<String> listUidUser = [];
    QuerySnapshot documentData =
        await userCollection.where("class", isEqualTo: classe).getDocuments();
    for (var document in documentData.documents) {
      listUidUser.add(document.data['uid']);
    }
    for (var uid in listUidUser) {
      ///AJOUT DANS LES UTILISATEURS DE LA SECTION
      await userCollection
          .document(uid)
          .collection("sections")
          .document(title)
          .setData({"title": title, "description": description});
      await userCollection
          .document(uid)
          .collection("sections")
          .document(title)
          .collection("skills")
          .document(skillTitle)
          .setData({
        "title": skillTitle,
        "description": skillDescription,
        "selfValidated": false,
        "validated": false
      });
    }

    listUidUser = [];
    documentData = await teacherCollection
        .where("class", isEqualTo: classe)
        .getDocuments();
    for (var document in documentData.documents) {
      listUidUser.add(document.data['uid']);
    }
    for (var uid in listUidUser) {
      ///AJOUT DANS LES UTILISATEURS DE LA SECTION
      await teacherCollection
          .document(uid)
          .collection("sections")
          .document(title)
          .setData({"title": title, "description": description});
      await teacherCollection
          .document(uid)
          .collection("sections")
          .document(title)
          .collection("skills")
          .document(skillTitle)
          .setData({"title": skillTitle, "description": skillDescription});
    }
  }

  Future insertNewSkill(String classe, String sectionTitle, String title,
      String description) async {
    await classCollection
        .document(classe)
        .collection("sections")
        .document(sectionTitle)
        .collection("skills")
        .document(title)
        .setData({"title": title, "description": description});

    List<String> listUidUser = [];
    QuerySnapshot documentData =
        await userCollection.where("class", isEqualTo: classe).getDocuments();
    for (var document in documentData.documents) {
      listUidUser.add(document.data['uid']);
    }
    for (var uid in listUidUser) {
      ///AJOUT DANS LES UTILISATEURS DE LA SECTION
      await userCollection
          .document(uid)
          .collection("sections")
          .document(sectionTitle)
          .collection("skills")
          .document(title)
          .setData({
        "title": title,
        "description": description,
        "selfValidated": false,
        "validated": false
      });
    }

    listUidUser = [];
    documentData = await teacherCollection
        .where("class", isEqualTo: classe)
        .getDocuments();
    for (var document in documentData.documents) {
      listUidUser.add(document.data['uid']);
    }
    for (var uid in listUidUser) {
      ///AJOUT DANS LES UTILISATEURS DE LA SECTION
      await teacherCollection
          .document(uid)
          .collection("sections")
          .document(sectionTitle)
          .collection("skills")
          .document(title)
          .setData({"title": title, "description": description});
    }
  }

  Future selfValidateSkill(
      String uid, String sectionTitle, String skillTitle, String classe) async {
    await userCollection
        .document(uid)
        .collection("sections")
        .document(sectionTitle)
        .collection("skills")
        .document(skillTitle)
        .updateData({"selfValidated": true});
    await classCollection.document(classe).updateData({
      "waiting": FieldValue.arrayUnion([
        {
          "sectionTitle": sectionTitle,
          "skillTitle": skillTitle,
          "uid": uid,
        }
      ])
    });
  }

  Future validateSkill(
      String uidUser, String sectionTitle, String skillTitle) async {
    await userCollection
        .document(uidUser)
        .collection("sections")
        .document(sectionTitle)
        .collection("skills")
        .document(skillTitle)
        .updateData({"validated": true});
  }

  Future<List<List<String>>> getMemberClass(data) async {
    var listMemberDocs = await userCollection.where("class").getDocuments();
    List<List<String>> res = [];
    for (var document in listMemberDocs.documents) {
      res.add([
        document.data['username'],
        document.data['class'],
        "assets/images/user.png"
      ]);
    }
    return res;
  }
}
