import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        title: Text("LoginPage"),
      ),
      body: Container(
        width: double.infinity,
        // height: 100,
        color: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._buildTextFields(),
                  SizedBox(
                    height: 32,
                  ),
                  ..._buildButton()
                ],
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
    Navigator.pushNamed(context, AppRoute.home);
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
}
