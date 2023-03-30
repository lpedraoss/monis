import 'package:monis/domain/model/user.dart';
import 'package:monis/data/repository/user_repository.dart';
import 'package:monis/utils/status.dart';

abstract class UserService extends UserInterface {
  Future<Status> loginUser({
    required String userName,
    required String password,
  });
}

class UserServicesFirebase extends UserService {
  final _repository = UserFirebaseRepository();
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
