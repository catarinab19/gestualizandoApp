import 'package:appsilva/screens/signInScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';

class Artigos extends StatelessWidget {
  //ApiMockUp apiMockUpAccounts;
  static String routeName = "/sign_in";

  // SignIn(this.apiMockUpAccounts);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        key: const Key('signin1'),
        title: Text(
          "Artigos",
          style: TextStyle(
            color: Colors.indigo[900],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[900],
      ),
      //body: SignInScreen(),
    );


  }
}