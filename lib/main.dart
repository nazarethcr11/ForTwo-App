import 'package:flutter/material.dart';
import 'package:for_two/inside_screens/home_screen.dart';
import 'package:for_two/UI/logo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:   HomeScreen(),
      //home: LogoScreen(),
    );
  }
}
