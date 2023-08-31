import 'package:flutter/material.dart';
import 'package:for_two/inside_screens/find_friends_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MainContactsScreen extends StatefulWidget {
  const MainContactsScreen({Key? key}) : super(key: key);

  @override
  State<MainContactsScreen> createState() => _MainContactsScreenState();
}

class _MainContactsScreenState extends State<MainContactsScreen> {
  List<String> itemsList=[
    'sinacaru',
    'pepino',
    'panda',
    'cobeda',
    'theicehornet',
    'kato',
  ];
  List<String>? itemsListSearch;
  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController? _textEditingController= TextEditingController();

  @override
  void dispose(){
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }
  String url= "https://www.sketchappsources.com/resources/source-image/profile-illustration-gunaldi-yunus.png";

  @override
  Widget build(BuildContext context) {
    Color theme_blue = Color.fromRGBO(31, 49, 157, 1);
    Color theme_white=Color.fromRGBO(248, 249, 252, 1.0);

    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 49, 157, 1),
        appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.white,
          backgroundColor:  Color.fromRGBO(31, 49, 157, 1),
          leading: IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.person_add,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(context,
                  PageTransition(child: FindFriendsScreen(), type:
                  PageTransitionType.rightToLeft
                  )
              );
            },
          ),
          title: Container(
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                decoration: InputDecoration(
                  prefix: Padding(padding: EdgeInsets.only(top: 20,left:8,right:5),
                  child: Icon(Icons.search,size:18,color: Colors.grey,),),
                  hintText: 'Find contacts',
                  border: InputBorder.none,
                ),

                onChanged: (value){
                  setState(() {
                    itemsListSearch=itemsList
                        .where((element) => element
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                        .toList();
                    if(_textEditingController!.text.isNotEmpty && itemsListSearch!.isEmpty){
                      print('itemsListSearch lenght ${itemsListSearch!.length}');
                    }
                  });
                },
              ),
            ),
          ),

          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.info_outline,
                  size: 30,
                ),
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12)
                          )
                      ),
                      builder: (BuildContext bc){
                        return Wrap(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  splashRadius: 20,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                      Icons.close
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20,bottom: 50,left: 15,right: 15),
                              child: Text("Las cuentas que se visualizan son las que anteriormente has vinculado como amigos. La cuenta no restringe un máximo de amigos, por lo cual son ilimitados.",
                                style: GoogleFonts.exo2(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  );
                },
              ),
            ),
          ],
        ),


        body: _textEditingController!.text.isNotEmpty && itemsListSearch!.isEmpty
            ?Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search_off,
                    size: 160,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "No results found",
                    style: TextStyle(
                        fontSize: 25,fontWeight: FontWeight.w500, color:  Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        )
        //other option
            :ListView.builder(
            itemCount: _textEditingController!.text.isNotEmpty
                ? itemsListSearch!.length
                : itemsList.length,
            itemBuilder: (context,index){
              return Padding(
                padding: EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(248, 249, 252, 1.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:ListTile(
                    onTap: (){

                    },
                    visualDensity: VisualDensity(vertical: -2),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(20), // Image radius
                        child: Image.network(url, fit: BoxFit.cover),
                      ),
                    ),
                    title: Text(_textEditingController!.text.isNotEmpty
                        ? itemsListSearch![index]
                        :itemsList[index],
                        style: GoogleFonts.exo2(
                            color: theme_blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    subtitle: Text("Usuario de 4Two",
                      style: GoogleFonts.exo2(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(31, 49, 157, 0.15),
                      ),
                      child: const Icon(Icons.arrow_forward_ios,size: 18,color: Color.fromRGBO(31, 49, 157, 1),),
                    ),
                  ),
                ),);
            }
        )
    );
  }
}


