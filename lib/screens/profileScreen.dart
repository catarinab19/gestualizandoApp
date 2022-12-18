import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/screens/signIn.dart';

import 'package:appsilva/model/userModel.dart';
import 'package:appsilva/widgets/sizeConfig.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();

  //final _auth = FirebaseAuth.instance;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    //SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      "${loggedInUser.name}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.indigo[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.06),
                    ElevatedButton(
                      key: const Key('logout'),
                      onPressed: () {
                        signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Colors.indigo[900],
                      ),
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signOut() async {
    await FirebaseAuth.instance.signOut(); //_auth.signOut();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ));
  }
}
