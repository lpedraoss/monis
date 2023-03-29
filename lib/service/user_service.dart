import 'package:monis/model/user.dart';
import 'package:monis/repository/user_repository.dart';

abstract class UserService extends UserInterface {}

class UserServicesFirebase extends UserService {
  final _repository = UserFirebaseRepository();
  @override
  Future<List<User>> getAllUsers() async => _repository.getAllUsers();

  @override
  Future<List<User>> getUser({required String userName}) async =>
      _repository.getUser(userName: userName);

  @override
  Future<void> removeUser({required String userId}) =>
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
}
