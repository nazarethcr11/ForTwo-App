import 'package:flutter/material.dart';
import 'package:for_two/UI/log_screen.dart';
import 'package:for_two/inside_screens/deleteaccount_screen.dart';
import 'package:for_two/inside_screens/edit_email_screen.dart';
import 'package:for_two/inside_screens/edit_password_screen.dart';
import 'package:for_two/inside_screens/edit_profile_screen.dart';
import 'package:for_two/inside_screens/support_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name_user="Silene Casma";
  String username_user="@Sinacaru";
  String description="A simple person";
  String url= "https://www.sketchappsources.com/resources/source-image/profile-illustration-gunaldi-yunus.png";
  int friends_user =23;
  int files_user =52;
  String password_user="#Sinacaru1103";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 49, 167, 1),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: Color.fromRGBO(31, 49, 167, 1),
        centerTitle: true,
        elevation: 1,
        backgroundColor:Color.fromRGBO(248, 249, 252, 1.0),
        title: Text(name_user,
          style: GoogleFonts.exo2(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500
          ),
        ),
        actions: <Widget>[
           Padding(padding: EdgeInsets.all(10),
             child: Material(
               color: Color.fromRGBO(31, 49, 157, 0.15),
               borderRadius: BorderRadius.circular(6),
               child: InkWell(
                 borderRadius: BorderRadius.circular(6),
                 onTap: (){
                   Navigator.push(context,
                       PageTransition(child: EditProfileScreen(description,username_user,name_user,url), type:
                       PageTransitionType.rightToLeft
                       )
                   );
                 },
                 child: Container(
                   padding: EdgeInsets.only(right: 10,left:10,),
                   child:  Center(
                     child: Text(". . .",
                       style: GoogleFonts.varelaRound(
                         fontSize: 16,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
           )


        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    color: Color.fromRGBO(248, 249, 252, 1.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                        borderRadius: BorderRadius.circular(25), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.network(url, fit: BoxFit.cover),
                        ),
                      ),
                        SizedBox(height: 7,),
                        Text(username_user,
                          style: GoogleFonts.exo2(
                              fontSize: 18,
                              color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Column(
                             children: [
                               Text(friends_user.toString(),style: GoogleFonts.exo2(fontWeight: FontWeight.bold),),
                               Text("Amigos", style: GoogleFonts.exo2(color: Colors.grey[800]),),
                             ],
                           ),
                            SizedBox(width: 30,),
                            Column(
                              children: [
                                Text(files_user.toString(),style: GoogleFonts.exo2(fontWeight: FontWeight.bold),),
                                Text("Archivos", style: GoogleFonts.exo2(color: Colors.grey[800]),),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
                child: Container(
                  color: Color.fromRGBO(31, 49, 167, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      ProfileOptions(title: "Contraseña",icon: LineAwesomeIcons.unlock,
                        onPress: (){
                          Navigator.push(context,
                              PageTransition(child: EditPasswordScreen(password_user), type:
                              PageTransitionType.rightToLeft
                              )
                          );
                        },
                      ),
                      ProfileOptions(title: "Correo electronico",icon: LineAwesomeIcons.envelope,
                        onPress: (){
                          Navigator.push(context,
                              PageTransition(child: EditEmailScreen(), type:
                              PageTransitionType.rightToLeft
                              )
                          );
                        },
                      ),
                      ProfileOptions(title: "Soporte",icon: LineAwesomeIcons.phone_volume,
                        onPress: (){
                          Navigator.push(context,
                              PageTransition(child: SupportScreen(), type:
                              PageTransitionType.rightToLeft
                              )
                          );
                        },
                      ),
                      ProfileOptions(title: "Delete Account",icon: LineAwesomeIcons.user_slash,
                        onPress: (){
                          Navigator.push(context,
                              PageTransition(child: DeleteAccountScreen(), type:
                              PageTransitionType.rightToLeft
                              )
                          );
                        },
                      ),
                      ProfileOptions(title: "Cerrar sesión",icon: LineAwesomeIcons.alternate_sign_out,
                        onPress: (){
                          Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context)=> const LogScreen()),
                                (Route<dynamic>route) => false,
                          );
                        },
                        endIcon:  false,),
                      SizedBox(height: 10,)
                    ],
                  ),

                )
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    Key?key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon=true,
    this.textColor,
}): super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.only(right: 30, left: 30,top: 15),
    child: Material(
      color: Color.fromRGBO(248, 249, 252, 1.0),
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromRGBO(31, 49, 157, 0.15),
          ),
          child:  Icon( icon, color:Color.fromRGBO(31, 49, 157, 1)),
        ),
        title: Text(title, style: GoogleFonts.exo2(
          fontSize: 16,
        ),
      ),
        trailing: endIcon? Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromRGBO(31, 49, 157, 0.15),
          ),
          child: const Icon(LineAwesomeIcons.angle_right,size: 18,color: Color.fromRGBO(31, 49, 157, 1),),
        ):null,
      ),
    ),
    );
  }
}
