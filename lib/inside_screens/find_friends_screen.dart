import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({Key? key}) : super(key: key);

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  List<String> itemsList=[
    'sinacaru',
    'pepino',
    'panda',
    'cobeda',
    'th',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(31, 49, 167, 1),
        leading: IconButton(
          splashRadius: 20,
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              controller: _textEditingController,
              focusNode: _textFocusNode,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefix: Icon(Icons.search),
                hintText: 'Search here',
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
        )

      ),

        body: _textEditingController!.text.isNotEmpty && itemsListSearch!.isEmpty
            ?Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search_off,
                      size: 160,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "no results found",
                      style: TextStyle(
                        fontSize: 25,fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              ),
            ),
        )
        //other option
        :ListView.builder(
          itemCount: _textEditingController!.text.isNotEmpty
            ? itemsListSearch!.length
            : itemsList.length,
            itemBuilder: (ctx,index){
            return Card(
              margin: EdgeInsets.symmetric(vertical: 1),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(_textEditingController!.text.isNotEmpty
                    ? itemsListSearch![index]
                    :itemsList[index]
                ),
              ),
            );
            }
        )
    );
  }
}
