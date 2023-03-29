// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  final String? id;
  final String name;
  final String userName;
  final String password;
  const User({
    this.id,
    this.name = '',
    this.userName = '',
    this.password = '',
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      userName: map['userName'] as String,
      password: map['password'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'userName': userName,
      'password': password,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? userName,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}
