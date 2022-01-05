import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundry_day/services/authenticate.dart';
import 'package:laundry_day/shared/constant.dart';
import 'package:laundry_day/shared/loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;

  //Text Field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
              centerTitle: true,
              title: const Text('Logga in'),
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: textInputDecoration
                          .copyWith(labelText: 'Email')
                          .copyWith(icon: const Icon(Icons.email)),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter email' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: textInputDecoration
                          .copyWith(labelText: 'Password')
                          .copyWith(icon: const Icon(Icons.lock)),
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter password' : null,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[700],
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                              error = "Wrong Credentials";
                            });
                            dynamic result =
                                await _auth.signIn(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: const Text('Logga in')),
                    const SizedBox(height: 20),
                    Text(error,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14)),
                  ],
                ),
              ),
            ));
  }
}
