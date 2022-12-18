import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:appsilva/screens/mainPageScreen.dart';
import 'package:appsilva/screens/transports/transporteScreen5.dart';

class Transporte5 extends StatelessWidget {
  static String routeName = "/transports5_page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        //key: const Key('signin1'),
        title: Text(
          "Transportes",
          style: TextStyle(
            color: Colors.lightGreen[400],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen[400],
      ),
      body: TransporteScreen5(),
    );


  }
}