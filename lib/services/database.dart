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
      // TODO : var sections = sectionCollection.where(field)
      return await userCollection.document(uidUser).setData({
        'email': email,
        'username': username,
        'password': password,
        // TODO : 'class':classe,
      });
    } else {
      return await teacherCollection.document(uidUser).setData({
        'email': email,
        'username': username,
        'password': password,
        //'class':classe
      });
    }
  }
}
