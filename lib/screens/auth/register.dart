import 'package:flutter/material.dart';
import 'package:laundry_day/shared/constant.dart';
import 'package:laundry_day/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  //Text Field state
  String email = "";
  String password = "";
  String error = "";

  bool loading = false;

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
              title: const Text('Register'),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
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
                      validator: (value) => value!.length < 6
                          ? 'Enter a min 6 char long password'
                          : null,
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
                            });
                          }
                        },
                        child: const Text('Register')),
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
