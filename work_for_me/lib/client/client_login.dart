// ignore_for_file: library_private_types_in_public_api

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
          const TextField(
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: !showPassword,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(showPassword
                    ? Icons.visibility_off
                    : Icons.visibility),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/client_reg_log');
            },
            child: const Text('Go to Client Area'),
          ),
        ],
      ),
    );
  }
}
