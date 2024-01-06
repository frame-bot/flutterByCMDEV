import 'package:cmflutter0/src/bloc/login_bloc.dart';
import 'package:cmflutter0/src/models/user.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // int _couter = 0;

  @override
  void initState() {
    super.initState();
    _usernameController.text = "admin";
    _passwordController.text = "1234";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text("LoginPage: ${state.count}");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: 100,
          color: Colors.blue[50],
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(32.0),
                height: 470,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._buildTextFields(),
                    SizedBox(
                      height: 32,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Text(
                            "Login Result: ${state.isAuthened ? "Sucsses" : "Fail"}",
                            style: TextStyle(
                                color: state.isAuthened
                                    ? Colors.green
                                    : Colors.red));
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ..._buildButton(),
                    Row(
                      children: [
                        // Text("Debug: ${context.read<LoginBloc>().state.count}"),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Text("DebugX: ${state.count}");
                          },
                        ),
                        IconButton(
                          // onPressed: _handleClickAdd,
                          onPressed: () {
                            context.read<LoginBloc>().add(LoginEventAdd());
                          },
                          icon: Icon(Icons.add),
                        ),
                        IconButton(
                          // onPressed: _handleClickRemove,
                          onPressed: () {
                            context.read<LoginBloc>().add(LoginEventRemove());
                          },
                          icon: Icon(Icons.remove),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    // print("frame naja ${_usernameController.text}");
    // print("frame naja ${_passwordController.text}");
    // Navigator.pushNamed(context, AppRoute.home);
    final user = User(
        username: _usernameController.text, password: _passwordController.text);
    context.read<LoginBloc>().add(LoginEventLogin(user));
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  void _handleClickReset() {
    _usernameController.text = "";
  }

  _buildTextFields() {
    return [
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(labelText: "Username"),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: "Password"),
      ),
    ];
  }

  _buildButton() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: Text("Login"),
      ),
      OutlinedButton(
        onPressed: _handleClickRegister,
        child: Text("Register"),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: Text("Reset"),
      ),
    ];
  }

  // void _handleClickAdd() {
  //   _couter++;
  //   setState(() {});
  // }

  // void _handleClickRemove() {
  //   _couter--;
  //   setState(() {});
  // }
}
