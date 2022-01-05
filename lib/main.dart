import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laundry_day/providers/calendar_event.dart';
import 'package:laundry_day/screens/auth/auth_home.dart';
import 'package:laundry_day/screens/home/home.dart';
import 'package:laundry_day/screens/wrapper.dart';
import 'package:laundry_day/services/authenticate.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => CalendarProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
    value: AuthService().onAuthChanges, 
    initialData: null, 
    child: const MaterialApp(
      title: "Laundry Day",
    home: Wrapper(),
    ),
    );
    
  }
}
