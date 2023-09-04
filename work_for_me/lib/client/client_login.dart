import 'package:flutter/material.dart';

class ClientLogin extends StatefulWidget {
  const ClientLogin({Key? key}) : super(key: key);

  @override
  _ClientLoginState createState() => _ClientLoginState();
}

class _ClientLoginState extends State<ClientLogin> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            obscureText: !showPassword,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: Text(showPassword ? 'Hide Password' : 'Show Password'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/client_reg_log');
            },
            child: const Text('Go to Registration'),
          ),
        ],
      ),
    );
  }
}
