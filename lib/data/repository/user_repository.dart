import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monis/domain/model/user.dart';



abstract class UserRepository  {
    ///find the book for [userName]
  Future<List<User>> getUser({required String userName});

  ///conect the DB to flutter app with reference [_usersRef]
  Future<List<User>> getAllUsers();

  ///save a user
  Future<String> saveUser({
    required String name,
    required String userName,
    required String password,
  });

  ///delete a user
  Future<void> removeUser({required String userId});
}

///Show [users] from firebase
class UserFirebaseRepository extends UserRepository {
  ///collection from firebase
  static const _userCollection = 'users';

  /// reference [_userCollection] from firebase
  static final userInstanceFirebase =
      FirebaseFirestore.instance.collection(_userCollection);
  final _usersRef = userInstanceFirebase.withConverter(
    fromFirestore: (snapshot, _) => User.fromMap(
      {...snapshot.data()!, "id": snapshot.id},
    ),
    toFirestore: (user, _) => user.toMap(),
  );

  @override
  Future<List<User>> getUser({required String userName}) async {
    var result = await _usersRef.get().then((value) => value);
    List<User> users = [];
    bool comparison;
    for (var doc in result.docs) {
      doc.data().userName;
      comparison = (doc.data().userName.toString() == (userName));

      if (comparison) {
        users.add(doc.data());
      }
    }
    return Future.value(users);
  }

  @override
  Future<List<User>> getAllUsers() async {
    var result = await _usersRef.get().then((value) => value);
    List<User> users = [];
    for (var doc in result.docs) {
      users.add(doc.data());
    }
    return Future.value(
      users,
    );
  }

  @override
  Future<void> removeUser({required String userId}) async {
    await userInstanceFirebase
        .doc(userId)
        .delete()
        .then((value) => throw 'User deleted succesfully')
        .catchError(throw 'Error deleting User');
  }

  @override
  Future<String> saveUser({
    required String name,
    required String userName,
    required String password,
  }) async {
    var newUser = await userInstanceFirebase.add({
      'name': name,
      'userName': userName,
      'password': password,
    });
    return Future.value(newUser.id);
  }
}
