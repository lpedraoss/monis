import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late final TextEditingController _userEditingController,
      _passwordEditingController;

  @override
  void initState() {
    _userEditingController = TextEditingController()
      ..addListener(_userListener);
    _passwordEditingController = TextEditingController()
      ..addListener(_passwordListener);
    super.initState();
  }

  void _resetFields() {
    _userEditingController.clear();
    _passwordEditingController.clear();
  }

  @override
  void dispose() {
    _userEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  void _userListener() {
    if (_userEditingController.text.isNotEmpty) {
      setState(() {
        messageWidget = null;
      });
    }
  }

  void _passwordListener() {
    if (_passwordEditingController.text.isNotEmpty) {
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
                controller: _userEditingController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor escribe tu usuario'
                    : null,
              ),
              TextFormField(
                controller: _passwordEditingController,
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
                  // setState(() {
                  //   messageWidget = messageLogin();
                  // });
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      messageLogin(status: state.status) ?? Container(),
                      Center(
                        child: ElevatedButton(
                          onPressed: _isLoading(state)
                              ? null
                              : () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context.read<AuthenticationBloc>().add(
                                          LoginEvent(
                                            password:
                                                _passwordEditingController.text,
                                            username:
                                                _userEditingController.text,
                                          ),
                                        );
                                    // await loginUser(
                                    //   context,
                                    //   userName: _userEditingController.text,
                                    //   password: _passwordEditingController.text,
                                    // );

                                  }
                                },
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

  bool _isLoading(AuthenticationState state) {
    return state.status == Status.inProgress;
  }

  //obtiene el icono de contraseña a mostrar
  IconData get _icon {
    return _showPassword ? Icons.visibility_off : Icons.visibility;
  }
}
