import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:appsilva/screens/animais/animal1.dart';
import 'package:appsilva/widgets/navBar.dart';
import 'package:appsilva/widgets/menuState.dart';
import 'package:appsilva/screens/transports/transporte1.dart';
import 'package:appsilva/screens/objetos/objeto1.dart';
import 'package:appsilva/screens/cores/cor1.dart';

class MainPageScreen extends StatefulWidget {
  static String routeName = "/main_page";

  @override
  _MainPageFormState createState() => _MainPageFormState();
}

class _MainPageFormState extends State<MainPageScreen> {
  final formKey = GlobalKey<FormState>();

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
                      "Categorias",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(28),
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    SizedBox(
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(60),
                      child: ElevatedButton.icon(
                        //key: const Key('signin'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Animal1(),
                              ));
                        },

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.indigo[900],
                        ),
                        label: Text(
                          'Animais',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                        icon: Icon(Icons.pets_rounded //cruelty_free
                            ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    SizedBox(
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(60),
                      child: ElevatedButton.icon(
                        //key: const Key('signin'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Transporte1(),
                              ));
                        },

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.indigo[900],
                        ),
                        label: Text(
                          'Transportes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                        icon: Icon(Icons.directions_car_filled_rounded
                            ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    SizedBox(
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(60),
                      child: ElevatedButton.icon(
                        //key: const Key('signin'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Objeto1(),
                              ));
                        },

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.indigo[900],
                        ),
                        label: Text(
                          'Objetos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                        icon: Icon(Icons.directions_car_filled_rounded
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    SizedBox(
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(60),
                      child: ElevatedButton.icon(
                        //key: const Key('signin'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                   Cor1(),
                              ));
                        },

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.indigo[900],
                        ),
                        label: Text(
                          'Cores',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                        icon: Icon(Icons.directions_car_filled_rounded
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
      bottomNavigationBar: NavBar(selectedMenu: MenuState.mainPage),
    );
  }
}
