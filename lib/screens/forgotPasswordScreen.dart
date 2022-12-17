import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appsilva/screens/signIn.dart';

import 'package:appsilva/widgets/sizeConfig.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    RichText(
                      // key: const Key('signscreen'),
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'Receive an email to reset your password',
                          style: TextStyle(
                              color: Colors.indigo[600],
                              fontSize: getProportionateScreenWidth(20)),
                        ),
                      ]),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        key: const Key('email'),
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: Icon(Icons.email_rounded),
                        ),
                        onSaved: (value) {
                          _emailTextController.text = value!;
                        },
                        //onSaved: (nvalue) => _email = nvalue,
                        /*onChanged: (value) {
                          if (value.isNotEmpty) {
                            removeError(error: 'Please enter your email');
                          }
                          return null;
                        },*/
                        validator: (value) {
                          if (value!.isEmpty) {
                            //  addError(error: "Please enter your email");
                            return "Email is required";
                          } else if (!EmailValidator.validate(value, true)) {
                            //   addError(error: "Please enter your email");
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(120)),
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(56),
                      child: ElevatedButton(
                        key: const Key('sendemail'),
                        onPressed: () { resetPassword; },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.indigo[900],
                        ),
                        child: Text(
                          'Send email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
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

  Future resetPassword() async {
    if (formKey.currentState!.validate()) {
      await _auth
          .sendPasswordResetEmail(email: _emailTextController.text)
          .then((uid) =>
      {
        Fluttertoast.showToast(msg: "Email Sent Successfully"),
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ))
      });
    }
  }
}
