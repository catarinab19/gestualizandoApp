import 'package:appsilva/screens/signInScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';

class SignIn extends StatelessWidget {
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
          "Sign In",
          style: TextStyle(
            color: Colors.pink[400],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink[400],
      ),
      body: SignInScreen(),
    );


  }
}