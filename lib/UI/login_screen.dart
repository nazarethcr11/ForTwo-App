import 'package:flutter/material.dart';
import 'package:for_two/UI/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        actions: [
          Padding(padding: EdgeInsets.all(15),
          child: Center(
            child: Text("Register",
              style: GoogleFonts.varelaRound(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),)
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(31, 49, 157, 1),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
            color: Color.fromRGBO(31, 49, 157, 1),
            child: Column(
              children: [
                Expanded(
                    flex:1,
                        child: Column(
                          children:  [
                            SizedBox(height: 15),
                            Padding(padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: FadeAnimation(0.8,Text("Inicia sesion",
                                style: GoogleFonts.varelaRound(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),)
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:                              Align(
                              alignment: Alignment.topLeft,
                              child: FadeAnimation(0.9,Text("Hola de nuevo, te extrañamos. Introduce",
                                style: GoogleFonts.varelaRound(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),)
                            ),
                            ),
                            SizedBox(height: 6),
                            Padding(padding: EdgeInsets.only(left: 20),
                              child:                              Align(
                                alignment: Alignment.topLeft,
                                child: FadeAnimation(0.9,Text("tus credenciales para ingresar.",
                                  style: GoogleFonts.varelaRound(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),)
                              ),
                            ),
                          ],
                        )
                    ),
                Expanded(
                  flex:3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //+++++++++++++++email
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: FadeAnimation(1.1,TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: Colors.white, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: Colors.white, width: 1),
                                  ),
                                  hintText: 'Email',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                                ),
                                validator: (value){
                                  if(value !=null && value.length<1){return 'This field cannot be empty';}
                                  else{return null;}
                                },
                              ),
                            ),),
                            //+++++++++++++++password
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: FadeAnimation(1.1,TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                border: OutlineInputBorder(),
                               enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.white, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.white, width: 1),
                                ),
                                hintText: 'Password',
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                                 suffixIcon: IconButton(
                                   onPressed: (){
                                   setState(() {
                                   _isVisible=!_isVisible;
                                   });
                                 },
                                 icon: _isVisible? Icon(Icons.visibility, color: Colors.grey,): Icon(Icons.visibility_off, color: Colors.grey),
                                 ),
                               ),
                                 validator: (value){
                                   if(value !=null && value.length<1){return 'This field cannot be empty';}
                                   else{return null;}
                                 },
                               obscureText: !_isVisible,
                               ),
                               ),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: FadeAnimation(1.2,Material(
                                color:  Color.fromRGBO(31, 49, 157, 1),
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  splashColor:  Color.fromRGBO(31, 49, 157, 0.5),
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                  },

                                  child:Container(
                                    padding: EdgeInsets.all(20),
                                    child:  Center(
                                      child: Text("Sign In",
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
                            SizedBox(height: 10),
                            //----------------skye
                            FadeAnimation(1.25,Image(
                              image: AssetImage('lib/images/back.png'),
                              height: 200,
                              fit: BoxFit.cover,
                            ),),
                          ],
                        ),
                      ),
                    ),

              ],
            )
          ),
    );
  }
}
