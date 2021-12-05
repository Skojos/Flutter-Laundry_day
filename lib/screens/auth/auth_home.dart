import 'package:flutter/material.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Laundy Day',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
          const Image(
            image: AssetImage('assets/washer.png'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Logga in'),
            style: TextButton.styleFrom(
                primary: Colors.white, backgroundColor: Colors.blue[900]),
          ),
          TextButton(onPressed: () {}, child: Text('Registera'))
        ],
      ),
    );
  }
}
