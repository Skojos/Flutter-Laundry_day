import 'package:flutter/material.dart';
import 'package:laundry_day/services/authenticate.dart';
import 'package:laundry_day/shared/constant.dart';
import 'package:laundry_day/shared/loading.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

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
            backgroundColor: Colors.blueGrey[900],
            appBar: AppBar(
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
              centerTitle: true,
              title: const Text('Registrera'),
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 10),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: textInputDecoration
                          .copyWith(labelText: 'Lägenhetsnummer')
                          .copyWith(icon: const Icon(Icons.person)),
                      validator: (value) =>
                          value!.isEmpty ? 'Ange lägenhetsnummer' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: textInputDecoration
                          .copyWith(labelText: 'Email')
                          .copyWith(
                              icon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          )),
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
                          .copyWith(labelText: 'Lösenord')
                          .copyWith(
                              icon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          )),
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
                    const SizedBox(height: 150),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[700],
                            minimumSize: Size(200, 50),
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                              Navigator.pop(
                                context,
                                _auth.registerWithEmailAndPassword(email, password)
                              );
                           
                            });
                          }
                        },
                        child: const Text('Registrera')),
                    Text(error,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14)),
                  ],
                ),
              ),
            ));
  }
}
