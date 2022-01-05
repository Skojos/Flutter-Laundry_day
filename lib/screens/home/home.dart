import 'package:flutter/material.dart';
import 'package:laundry_day/screens/home/calendar.dart';
import 'package:laundry_day/services/authenticate.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        elevation: 0.0,
        title: Text('Welcome user'),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Calendar()));
          },
          child: const Text('Kalender')),
    );
  }
}
