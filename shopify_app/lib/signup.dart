import './home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up Page",
      home: Sign(),
    );
  }
}

class Sign extends StatefulWidget {
  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final formkey = GlobalKey<FormState>();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up Now!!")),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(40),
            child: Form(
              key: formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/logo.png',
                          height: 200, width: 200),
                    ),
                    TextFormField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        hintText: 'enter the username',
                        prefixIcon: Icon(Icons.person_4_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pls enter your username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'enter your password',
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'pls enter your password';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: confirmpasswordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'confirm your password',
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm your password';
                        }
                        if (value != passwordcontroller.text) {
                          return 'passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    // Login button
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => App()),
                          );
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ]),
            )),
      ),
    );
  }
}
