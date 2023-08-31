import 'package:flutter/material.dart';
import 'package:for_two/UI/FadeAnimation.dart';
import 'package:for_two/UI/login_screen.dart';
import 'package:for_two/UI/singup_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({Key? key}) : super(key: key);

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
                bottom: -400,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      color: Color.fromRGBO(31, 49, 157, 1),
                  ),
                )
            ),
            Positioned(
              bottom: 7,
              child: Image(
                image: AssetImage('lib/images/skye_logo.png'),
                height: 80,
              ),
              ),

              Align(
              alignment: Alignment.center,
              child: Container(
              width: size.width,
              height: size.height - (size.height * 0.4),
              child: SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                FadeAnimation(1.0,Image(
                  image: AssetImage('lib/images/logo_for2.png'),
                  height: 40,
                ),),
                SizedBox(height: 50,),
                FadeAnimation(1.1,Image(
                  image: AssetImage('lib/images/for2.png'),
                  height: 120,
                ),),
                SizedBox(height: 20,),
                FadeAnimation(1.1,Text("Share more, Know more",
                  style: GoogleFonts.ooohBaby(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: FadeAnimation(1.2,Material(
                    color:  Color.fromRGBO(31, 49, 157, 1),
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      splashColor:  Color.fromRGBO(31, 49, 157, 0.5),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(context,
                            PageTransition(child: LoginScreen(), type:
                            PageTransitionType.rightToLeft
                            ));
                      },

                      child:Container(
                        padding: EdgeInsets.all(20),
                        child:  Center(
                          child: Text("Iniciar sesion",
                            style: GoogleFonts.varelaRound(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),),

                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: FadeAnimation(1.2,Material(
                    color:  Color.fromRGBO(31, 49, 157, 1),
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      splashColor:  Color.fromRGBO(31, 49, 157, 0.5),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(context,
                            PageTransition(child: SingupScreen(), type:
                            PageTransitionType.rightToLeft
                            ));
                      },
                      child:Container(
                        padding: EdgeInsets.all(20),
                        child:  Center(
                          child: Text("Registrarse",
                            style: GoogleFonts.varelaRound(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),),

            ],))))

          ],
        ),
      ),
    );
  }
}
