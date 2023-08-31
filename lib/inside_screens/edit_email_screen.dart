import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({Key? key}) : super(key: key);

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(31, 49, 167, 1),
        elevation: 0,
        centerTitle: true,
        title: Text("Correo",
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
                    labelText: 'Ingrese correo actual',
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
                    labelText: 'Ingrese correo nuevo',
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
                    labelText: 'Repita el correo',
                    labelStyle: TextStyle(
                      color: Colors.grey[700],
                    )
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text("EL correo debe ser valido y real. El correo solo se puede cambiar una vez al mes. ",
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
