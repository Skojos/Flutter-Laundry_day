import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundry_day/screens/auth/auth_home.dart';
import 'package:laundry_day/screens/home/calendar.dart';
import 'package:laundry_day/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    
    if (user == null) {
      return AuthHome();
    } else {
      return Home();
    }
    

  }
}
