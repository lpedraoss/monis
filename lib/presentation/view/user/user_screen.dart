import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/main.dart';
import 'package:monis/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:monis/presentation/view/common/widget/header/header.dart';
import 'package:monis/presentation/view/common/widget/loading.dart';
import 'package:monis/utils/status.dart';
import 'package:monis/utils/utils.dart';

final _formKey = GlobalKey<FormState>();

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
  Widget? messageWidget;

  var _showPassword = false;

  ///access the values ​​of [textFormfield] via controller
  late final TextEditingController _userController, _passwordController;

  @override
  void initState() {
    _userController = TextEditingController()..addListener(_userListener);
    _passwordController = TextEditingController()
      ..addListener(_passwordListener);
    super.initState();
  }

  void _resetFields() {
    _userController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _userListener() {
    if (_userController.text.isNotEmpty) {
      setState(() {
        messageWidget = null;
      });
    }
  }

  void _passwordListener() {
    if (_passwordController.text.isNotEmpty) {
      setState(() {
        messageWidget = null;
      });
    }
  }

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
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
              ),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              TextFormField(
                controller: _userController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor escribe tu usuario'
                    : null,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                    labelText: 'Contraseña',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        _icon,
                      ),
                    )),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor escribe tu contraseña'
                    : null,
              ),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state.status == Status.fail) {
                    setState(() {
                      messageWidget = messageLogin(status: state.status);
                    });
                  } else if (state.status == Status.success) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const NavigationScreen(),
                      ),
                      (route) => false,
                    );
                  }
                  // setState(() {
                  //   messageWidget = messageLogin();
                  // });
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      messageWidget ?? Container(),
                      Center(
                        child: ElevatedButton(
                          onPressed: _isLoading(state) ? null : onLogin,
                          child: _isLoading(state)
                              ? const Loading()
                              : const Text('Confirmar'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  onLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthenticationBloc>().add(
            LoginEvent(
              password: _passwordController.text,
              username: _userController.text,
            ),
          );
      // await loginUser(
      //   context,
      //   userName: _userEditingController.text,
      //   password: _passwordEditingController.text,
      // );

    }
  }

  bool _isLoading(AuthenticationState state) {
    return state.status == Status.inProgress;
  }

  //obtiene el icono de contraseña a mostrar
  IconData get _icon {
    return _showPassword ? Icons.visibility_off : Icons.visibility;
  }
}
