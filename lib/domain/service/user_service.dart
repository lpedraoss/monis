import 'package:monis/domain/model/user.dart';
import 'package:monis/data/repository/user_repository.dart';
import 'package:monis/utils/status.dart';

abstract class UserService {
  Future<Status> loginUser({
    required String userName,
    required String password,
  });

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

class UserServicesFirebase extends UserService {
  late final UserRepository _repository;
  UserServicesFirebase(this._repository);

  @override
  Future<List<User>> getAllUsers() async => _repository.getAllUsers();

  @override
  Future<List<User>> getUser({required String userName}) async =>
      _repository.getUser(userName: userName);

  @override
  Future<void> removeUser({required String userId}) async =>
      _repository.removeUser(userId: userId);

  @override
  Future<String> saveUser(
          {required String name,
          required String userName,
          required String password}) async =>
      _repository.saveUser(
        name: name,
        userName: userName,
        password: password,
      );

  @override
  Future<Status> loginUser({
    required String userName,
    required String password,
  }) async {
    final users = await getUser(userName: userName);
    final nameUser = users.map((e) => e.userName);
    final passUser = users.map((e) => e.password);
    Status status;
    nameUser.contains(userName) == true && passUser.contains(password)
        ? status = Status.success
        : status = Status.fail;
    return status;
  }
}
