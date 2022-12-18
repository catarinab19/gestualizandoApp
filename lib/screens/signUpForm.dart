import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appsilva/widgets/account.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
//import '../apiMockUp.dart';
import '../model/userModel.dart';
//import 'casaView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appsilva/screens/forgotPassword.dart';


class SignUpForm extends StatefulWidget {
  @override
  //ApiMockUp apiMockUp;
  // SignUpForm(this.apiMockUp);
  _SignUpFormState createState() => _SignUpFormState(/*apiMockUp*/);
}

class _SignUpFormState extends State<SignUpForm> {
  //ApiMockUp apiMockUp;
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final _nameEditingController = new TextEditingController();
  final _emailEditingController = new TextEditingController();
  final _passwordEditingController = new TextEditingController();
  final _confirmPasswordEditingController = new TextEditingController();

  String? errorMessage;
  /* String? name;
  String? email;
  String? password;
  String? confirm_password;
  bool remember = false;*/
  final List<String> errors = [];

  //_SignUpFormState(this.apiMockUp);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              // name
              key: const Key('name'),
              controller: _nameEditingController,
              onSaved: (value) {
                _nameEditingController.text = value!;
              },
              onChanged: (value) {
                //_nameEditingController.text = value!;
                _nameEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _nameEditingController.text.length));
                //_nameEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _nameEditingController.text.length));
                if (value.isNotEmpty) {
                  removeError(error: "Please enter your name");
                  _nameEditingController.text = value;
                }
                return null;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: "Please enter your name");
                  return "Name can't be empty";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Enter your first and last names",
                //helperText: "*Required",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Icon(Icons.person_rounded),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              // email
              key: const Key('email'),
              controller: _emailEditingController,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                _emailEditingController.text = value!;
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: "Please enter your email");
                  _emailEditingController.text = value;
                } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  removeError(error: "Please enter a valid email");
                }
                return null;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: "Please enter your email");
                  return "Email can't be empty";
                } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  addError(error: "Please enter a valid email");
                  return "Invalid email format";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                //helperText: "*Required",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              //password
              key: const Key('password'),
              controller: _passwordEditingController,
              obscureText: true,
              onSaved: (value) {
                _passwordEditingController.text = value!;
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: "Please enter your password");
                } else if (value.length < 9) {
                  removeError(error: "Password is too short");
                }
                _passwordEditingController.text = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  _passwordEditingController.text = value;
                  addError(error: "Please enter your password");
                  return "Password can't be empty";
                } else if (value.length < 9) {
                  addError(error: "Please enter a valid password");
                  return "Minimum 9 characters";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                //helperText: "*Required",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Icon(Icons.lock_clock_rounded),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              key: const Key('confirm_password'),
              controller: _confirmPasswordEditingController,
              obscureText: true,
              onSaved: (value) {
                _confirmPasswordEditingController.text = value!;
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: "Please enter your password");
                } else if (_passwordEditingController.text == _confirmPasswordEditingController.text) {
                  removeError(error: "Passwords don't match");
                }
                _confirmPasswordEditingController.text = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: "Please enter your password");
                  return "Confirm Password can't be empty";
                } else if (_passwordEditingController.text != value) {
                  addError(error: "Passwords don't match");
                  return "Passwords don't match";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                hintText: "Re-enter your password",
                //helperText: "*Required",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Icon(Icons.lock_clock_rounded),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenHeight(56),
            ),
            ElevatedButton(
                key: const Key('Continue'),
                onPressed: () {
                  signUpB(_emailEditingController.text, _passwordEditingController.text);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: Colors.indigo[900],
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(15),
                    color: Colors.white,
                  ),
                ))
          ],
        ));
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }
  void signUpB(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.name = _nameEditingController.text;
    userModel.email = user!.email;
    userModel.uid = user.uid;


    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotPassword(),//CasaView(),
        ));
  }
}
