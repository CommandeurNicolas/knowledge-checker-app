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
    QuerySnapshot documentData = await classCollection
        .where("title", isEqualTo: classe)
        .getDocuments();
    var documents = documentData.documents;

    return documents[0].data['sections'];
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
      var sections = await getSectionsClasses(classe);
      return await userCollection.document(uidUser).setData({
        'uid': uidUser,
        'email': email,
        'username': username,
        'password': password,
        'class': classe,
        'sections': sections,
      });
    } else {
      var sections = await getSectionsClasses(classe);
      return await teacherCollection.document(uidUser).setData({
        'uid': uidUser,
        'email': email,
        'username': username,
        'password': password,
        'class': classe,
        'sections': sections,
      });
    }
  }

  Stream<QuerySnapshot> get classes {
    return classCollection.snapshots();
  }

  ///
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

}
