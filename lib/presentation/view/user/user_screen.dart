import 'package:flutter/material.dart';
import 'package:monis/presentation/view/common/widget/header/header.dart';
import 'package:monis/utils/utils.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserLoginScreen();
  }
}

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserLoginScreenState();
  }
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  ///access the values ​​of [textFormfield] via controller
  final _userEditingController = TextEditingController(),
      _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const Padding(padding: EdgeInsets.only(bottom: 30)),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              TextFormField(
                controller: _userEditingController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor escribe tu usuario'
                    : null,
              ),
              TextFormField(
                controller: _passwordEditingController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor escribe tu contraseña'
                    : null,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginUser(
                        userName: _userEditingController.text,
                        password: _passwordEditingController.text,
                        context: context,
                      );
                    }
                  },
                  child: const Text('confirmar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
