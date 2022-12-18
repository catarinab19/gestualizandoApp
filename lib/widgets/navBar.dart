import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/apiMockUp.dart';
import 'package:appsilva/screens/mainPage.dart';
import 'package:appsilva/screens/profile.dart';
import 'package:appsilva/screens/artigos.dart';
import 'menuState.dart';

class NavBar extends StatelessWidget {
  ApiMockUp apiMockUp = ApiMockUp();
  NavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(Icons.house_outlined),
                  color: Colors.pink[300],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                  }),
              IconButton(
                  icon: Icon(Icons.list_alt_rounded),
                  color: Colors.pink[300],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Artigos(),
                        ));
                  }),
              IconButton(
                  icon: Icon(Icons.person_outline_rounded),
                  color: Colors.pink[300],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile()),
                    );
                  }
              ),
            ],
          )),
    );
  }
}