import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart'as http;

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  void lauchWhatsapp({@required number,@required message})async{
    Uri url=Uri.parse("whatsapp://send?phone=$number&text=$message");

    await canLaunchUrl(url)? launchUrl(url):print("cant open whatsapp");
  }
  Future sendEmail({required name,required email,required subject,required message}) async{
    final serviceId='service_yfptf6f';
    final templateId='template_kxkx162';
    final userId='TR-pl-nKG9iSfQSnR';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
        url,
      headers: {
          'origin':'http://localhost',
          'Content-Type':'application/json'
      },
      body: json.encode({
        'service_id' : serviceId,
        'template_id' : templateId,
        'user_id': userId,
        'template_params':{
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message':message,
        }
      }),
    );

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(31, 49, 167, 1),
        elevation: 0,
        centerTitle: true,
        title: Text("Soporte",
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network("https://img.freepik.com/free-vector/flat-design-illustration-customer-support_23-2148887720.jpg",
            width: 300,
            height: 300,
            ),
            Text("¿Como podemos ayudarte?", style: GoogleFonts.exo2(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Text("Parece que estas presentando problemas con alguno de nuestros procesos. Estamos aqui para ayudarte; por favor ponte en contacto con nosotros",
                textAlign: TextAlign.center,
                style: GoogleFonts.exo2(
                fontSize: 16,
                color: Colors.black,
                ),
              ),
            ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  lauchWhatsapp(number: "+51995669450", message: "Hola, soy usuario de 4TWO App con código de identificación: 1601. Recientemente he presentado algún/os problemas con la aplicación, por lo que solicito apoyo.");
                },
                splashColor: Colors.black,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(31, 49, 167, 0.95),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Icon(
                        LineAwesomeIcons.rocket_chat,
                        size:55,
                        color: Colors.white,
                      ),
                      SizedBox(height: 5,),
                      Text("Chat", style: GoogleFonts.exo2(
                        fontSize: 16,
                        color: Colors.white,
                      ),),
                    ],
                  )
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  sendEmail(name: 'user', email: 'user@gmail.com', subject: 'Problems with 4Two App', message: 'Hola, soy usuario de 4TWO App con código de identificación: 1601. Recientemente he presentado algún/os problemas con la aplicación, por lo que solicito apoyo.');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Container(
                      child: Text("Enviaste un correo solicitando ayuda"),
                    ),
                    behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                splashColor: Colors.black,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 49, 167, 0.95),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Icon(
                          LineAwesomeIcons.envelope,
                          size:55,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5,),
                        Text("Correo", style: GoogleFonts.exo2(
                          fontSize: 16,
                          color: Colors.white,
                        ),),
                      ],
                    )
                ),
              ),
            ],
          )
          ],
        ),
      ),
    );
  }
}
