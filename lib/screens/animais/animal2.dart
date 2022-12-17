import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:appsilva/screens/mainPageScreen.dart';
import 'package:appsilva/screens/animais/animalScreen2.dart';


class Animal2 extends StatelessWidget {
  static String routeName = "/animal2_page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        //key: const Key('signin1'),
        title: Text(
          "Animais",
          style: TextStyle(
            color: Colors.indigo[900],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[900],
      ),
      body: AnimalScreen2(),
    );


  }
}