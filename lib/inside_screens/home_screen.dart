import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:for_two/inside_screens/edit_password_screen.dart';
import 'package:for_two/inside_screens/main_contacts_screen.dart';
import 'package:for_two/inside_screens/main_home_screen.dart';
import 'package:for_two/inside_screens/profile_screen.dart';
import 'package:page_transition/page_transition.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index =1;
  final navigationKey=GlobalKey<CurvedNavigationBarState>();
  final screens=[
    ProfileScreen(),
    MainHomeScreen(),
    MainContactsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final items=<Widget>[
      Icon(Icons.person,color: Color.fromRGBO(31, 49, 157, 1),),
      Icon(Icons.home,color: Color.fromRGBO(31, 49, 157, 1),),
      Icon(Icons.contacts,color: Color.fromRGBO(31, 49, 157, 1),),
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        index: index,
        height: 55,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 250),
        items: items,
        onTap: (index) =>setState(()=>this.index=index),
      ),
      body: screens[index]
    );
  }
}
