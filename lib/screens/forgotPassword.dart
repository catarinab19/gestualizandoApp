import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:appsilva/screens/addScreen.dart';
import 'package:appsilva/widgets/sizeConfig.dart';

import 'forgotPasswordScreen.dart';


class ForgotPassword extends StatelessWidget {

  static String routeName = "/forgotPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('signin1'),
        title: Text(
          "Forgot Password",
          style: TextStyle(
            color: Colors.indigo[900],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[900],
      ),
      body: ForgotPasswordScreen(),
    );


  }
}