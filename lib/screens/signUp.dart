import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/screens/signUpForm.dart';
//import 'package:prototipo/sizeConfig.dart';
//import 'package:prototipo/apiMockUp.dart';
import 'package:appsilva/screens/signUpForm.dart';
import 'package:appsilva/widgets/sizeConfig.dart';

class SignUp extends StatelessWidget {
  //ApiMockUp apiMockUp;
  //SignUp(this.apiMockUp);
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        key: const Key('signup1'),
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.indigo[900],
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[900],
      ),
      body: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Text(
                    "Register Account",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  SignUpForm(/*apiMockUp*/),
                  //SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'By continuing you confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
