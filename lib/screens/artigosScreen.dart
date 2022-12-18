import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:appsilva/widgets/navBar.dart';
import 'package:appsilva/widgets/menuState.dart';

class ArtigosScreen extends StatelessWidget {
  //ApiMockUp apiMockUpAccounts = ApiMockUp();
  static String routeName = '/artigo-screen';

  //WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Material(
        // key: const Key('welcome1'),
        type: MaterialType.transparency,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Artigos",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.pink[300],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(selectedMenu: MenuState.mainPage),
    );
  }
}