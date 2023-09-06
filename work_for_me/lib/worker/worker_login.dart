// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class WorkerLogin extends StatefulWidget {
  const WorkerLogin({Key? key}) : super(key: key);

  @override
  _WorkerLoginState createState() => _WorkerLoginState();
}

class _WorkerLoginState extends State<WorkerLogin> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worker Login'),
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
                icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility),
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
              Navigator.pushNamed(context, '/worker_dashboard');
            },
            child: const Text('Go to Worker Dashboard'),
          ),
        ],
      ),
    );
  }
}
