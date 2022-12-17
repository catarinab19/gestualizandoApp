import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:appsilva/screens/signUp.dart';
import 'package:appsilva/screens/forgotPassword.dart';
import 'package:appsilva/screens/mainPage.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignInScreen> {
  // int i = -1;
  final formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  String? errorMessage;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
                    Text(
                      "LGP",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(28),
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    RichText(
                      // key: const Key('signscreen'),
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(color: Colors.blueGrey[400]),
                          ),

                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(color: Colors.indigo[700]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUp(),
                                      ));
                                }),
                          //}),
                        ],
                      ),
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
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            removeError(error: 'Please enter your email');
                          }
                          return null;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            addError(error: "Please enter your email");
                            return "Email is required";
                          } else if (!EmailValidator.validate(value, true)) {
                            addError(error: "Please enter your email");
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        key: const Key('password'),
                        controller: _passwordTextController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: Icon(Icons.lock_clock_rounded),
                        ),
                        onSaved: (value) {
                          _passwordTextController.text = value!;
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            removeError(error: 'Please enter your password');
                          }
                          return null;
                        },
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            addError(error: "Please enter your password");
                            return "Password is required";
                          }
                          if (!regex.hasMatch(value)) {
                            return "Password is invalid";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Forgot Password?',
                              style: TextStyle(color: Colors.indigo[700]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPassword(),
                                      ));
                                }),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(120)),
                    SizedBox(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(56),
                      child: ElevatedButton(
                        key: const Key('signin'),
                        onPressed: () {
                          signInB(_emailTextController.text,
                              _passwordTextController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(/*apiMockUpAccounts*/),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.indigo[900],
                        ),
                        child: Text(
                          'Sign in',
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

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void signInB(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
         /* Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignIn(),//CasaView(),
              ))*/
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}