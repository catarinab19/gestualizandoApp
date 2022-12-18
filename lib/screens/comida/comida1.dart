import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:appsilva/screens/mainPageScreen.dart';
import 'package:appsilva/screens/comida/comidaScreen1.dart';

class Comida1 extends StatelessWidget {
  static String routeName = "/comida1_page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        //key: const Key('signin1'),
        title: Text(
          "Comida",
          style: TextStyle(
            color: Colors.purple[300],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple[300],
      ),
      body: ComidaScreen1(),
    );


  }
}