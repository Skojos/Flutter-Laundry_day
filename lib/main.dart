import 'package:flutter/material.dart';
import 'package:laundry_day/providers/calendar_event.dart';
import 'package:laundry_day/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CalendarProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Laundry Day',
      home: Wrapper(),
    );
  }
}
