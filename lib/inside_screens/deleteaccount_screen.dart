import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(31, 49, 167, 1),
        elevation: 0,
        centerTitle: true,
        title: Text("Eliminar Cuenta",
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
                child: Text("Regresar",
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
                  child: Text("Confirmar",
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
                  labelText: 'Ingresa la contraseña',
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                  )
              ),
            ),
          ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text("Para confirmar la autenticidad del usuario ingresa la contraseña. Recuerda que la cuenta no se podrá recuperar de ninguna forma.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                decoration:  InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(31, 49, 167, 1)),
                    ),
                    labelText: 'Ingrese las razones',
                    labelStyle: TextStyle(
                      color: Colors.grey[700],
                    )
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text("Por ultimo indícanos el por qué de la eliminacion de su cuenta, a fin de seguir mejorando nuestro servicio para con los usuarios.",
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