import 'package:flutter/material.dart';
import 'package:for_two/UI/log_screen.dart';
import 'package:for_two/UI/login_screen.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }
  void goToLogin() async{
    await Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=> const LogScreen()),
              (Route<dynamic>route) => false,
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 49, 157, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/images/skye_logo.png'),
              height: 150,
            ),
          ],
        )
      ),
    );
  }
}
