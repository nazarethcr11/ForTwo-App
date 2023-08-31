import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class EditProfileScreen extends StatefulWidget {
  final String _description;
  final String _name_user;
  final String _username_user;
  final String _url;

  EditProfileScreen(this._description, this._username_user,this._name_user, this._url);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState(description:_description,name_user:_name_user,username_user:_username_user,url:_url);
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final  description;
  final  name_user;
  final  username_user;
  final  url;
  _EditProfileScreenState({required this.description,required this.name_user,required this.username_user, required this.url});
  //-----------------------------
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading=false;
  File fileToDisplay = File("");
  bool picked=false;

  void pickFile() async{
    try{
      setState(() {
        isLoading=true;
      });
      result=await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false
      );
      if(result!=null){
        _fileName=result!.files.first.name;
        pickedfile=result!.files.first;
        fileToDisplay=File(pickedfile!.path.toString());
        
        print('File name $_fileName');
        picked=true;
      }

      setState(() {
        isLoading=false;
      });
    }catch(e){
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(31, 49, 167, 1),
        elevation: 0,
        centerTitle: true,
        title: Text("Perfil",
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
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Stack(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(50), // Image radius
                        child: picked?Image.file(fileToDisplay):Image.network(url, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(31, 49, 167, 1),
                      ),
                      child: IconButton(
                        splashRadius: 23,
                        icon: Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          pickFile();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                initialValue: name_user,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(31, 49, 167, 1)),
                    ),
                  labelText: 'Nombre y Apellido',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(31, 49, 167, 1)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                initialValue: username_user,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(31, 49, 167, 1)),
                  ),
                  labelText: 'Nombre de usuario',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(31, 49, 167, 1)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                initialValue: description,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(31, 49, 167, 1)),
                  ),
                  labelText: 'Descripción',
                  labelStyle: TextStyle(
                        color: Color.fromRGBO(31, 49, 167, 1)
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
