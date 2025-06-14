import 'package:flutter/material.dart';
import 'new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning English',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
