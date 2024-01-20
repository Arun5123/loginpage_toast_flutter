import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      home: Scaffold(
        appBar: AppBar(title: const Text("Login Page")),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: ListView(
        children: <Widget>[
          const Center(
            child: Text(
              'KCET',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 50,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 25),
            ),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Login', style: TextStyle(fontSize: 20)),
            onPressed: () => _handleLogin(),
          ),
        ],
      ),
    );
  }
  void _handleLogin() {
    String password = passwordController.text;
    if (validatePassword(password)) {
      _showDialog('Login Successful', 'Welcome! You have successfully logged in.');
    } else {
      _showDialog(
        'Invalid Password',
        'Password should be 8 to 15 characters long and contain at least one digit, one special character, and one uppercase and lowercase letter.',
      );
    }
  }

  bool validatePassword(String password) {
    RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+]).{8,15}$');
    return passwordRegExp.hasMatch(password);
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
