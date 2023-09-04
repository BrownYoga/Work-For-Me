// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ClientRegistration extends StatefulWidget {
  const ClientRegistration({Key? key}) : super(key: key);

  @override
  _ClientRegistrationState createState() => _ClientRegistrationState();
}

class _ClientRegistrationState extends State<ClientRegistration> {
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
        title: const Text('Client Registration'),
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
                TextButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Text(_obscureText ? "Show" : "Hide"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process registration
                  Navigator.pop(context);
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
