import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class EditPasswordScreen extends StatefulWidget {
  final String _password_user;

  EditPasswordScreen(this._password_user);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState(password_user:_password_user);
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final password_user;
  _EditPasswordScreenState({required this.password_user});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(31, 49, 167, 1),
        elevation: 0,
        centerTitle: true,
        title: Text("Contraseña",
          style: GoogleFonts.exo2(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        leadingWidth: 100,
        leading:Padding(padding: EdgeInsets.all(15),
          child: InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(

              child:  Center(
                child: Text("Cancelar",
                  style: GoogleFonts.exo2(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(padding: EdgeInsets.all(15),
            child: InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              onTap: (){
              },
              child: Container(

                child:  Center(
                  child: Text("Guardar",
                    style: GoogleFonts.exo2(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                decoration:  InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(31, 49, 167, 1)),
                    ),
                    labelText: 'Ingrese contraseña actual',
                    labelStyle: TextStyle(
                      color: Colors.grey[700],
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(31, 49, 167, 1)),
                    ),
                    labelText: 'Ingrese contraseña nueva',
                    labelStyle: TextStyle(
                        color: Colors.grey[700],
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                decoration:  InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(31, 49, 167, 1)),
                    ),
                    labelText: 'Repita la contraseña',
                    labelStyle: TextStyle(
                      color: Colors.grey[700],
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text("La contraseña solo puede contener simbolos, letras y números. La contraseña solo se puede cambiar una vez al mes. ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
