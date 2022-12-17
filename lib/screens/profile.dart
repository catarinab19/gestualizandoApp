import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/screens/profileScreen.dart';
import 'package:appsilva/screens/signIn.dart';
import 'package:appsilva/widgets/sizeConfig.dart';

class Profile extends StatelessWidget {
  //ApiMockUpAccounts apiMockUpAccounts;
  static String routeName = "/profile";
  final _auth = FirebaseAuth.instance;

  //Add(this.apiMockUpAccounts);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          key: const Key('profile1'),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.indigo[900],
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.indigo[900],
        ),
       // body: ProfileScreen()
    );
  }
}