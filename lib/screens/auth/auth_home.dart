import 'package:flutter/material.dart';
import 'package:laundry_day/screens/auth/register.dart';
import 'package:laundry_day/screens/auth/sign_in.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
    alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            const Text(
              'Laundry Day',
              style: TextStyle(color: Colors.white, fontSize: 35.0),
            ),
            const SizedBox(height: 20),
            const Image(
              height: 150,
              width: 150,
              image: AssetImage('assets/washer.png'),
              
            ),
            const SizedBox(height: 180),
            Container(
          width: 350,
              child: TextButton(
                onPressed: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                },
                child: const Text('Logga in', style: TextStyle(fontSize: 20)),
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.blue[900]),
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: 350,
              child: TextButton(onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
              }, child: const Text('Registera', style: TextStyle(fontSize: 20)), style: TextButton.styleFrom(
                primary: Colors.white,backgroundColor: Colors.blueGrey[400]
              )),
            ),
          ],
        ),
      ),
    );
  }
}
