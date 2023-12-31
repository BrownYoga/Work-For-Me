// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class WorkerRegistration extends StatefulWidget {
  const WorkerRegistration({Key? key}) : super(key: key);

  @override
  _WorkerRegistrationState createState() => _WorkerRegistrationState();
}

class _WorkerRegistrationState extends State<WorkerRegistration> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worker Registration'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            if (_image != null)
              Image.file(
                _image!,
                height: 100,
                width: 100,
              ),
            ElevatedButton(
              onPressed: getImage,
              child: const Text("Upload Profile Picture"),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Username'),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter a username';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter an email';
              //   }
              //   return null;
              // },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: _obscureText,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter a password';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process registration
                  Navigator.pushNamed(context, '/worker_login');
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
