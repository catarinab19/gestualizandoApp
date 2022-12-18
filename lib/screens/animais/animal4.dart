import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:appsilva/screens/mainPageScreen.dart';
import 'package:appsilva/screens/animais/animalScreen4.dart';


class Animal4 extends StatelessWidget {
  static String routeName = "/animal4_page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        //key: const Key('signin1'),
        title: Text(
          "Animais",
          style: TextStyle(
            color: Colors.red[300],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red[300],
      ),
      body: AnimalScreen4(),
    );


  }
}