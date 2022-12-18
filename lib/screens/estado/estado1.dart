import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:appsilva/screens/mainPageScreen.dart';
import 'package:appsilva/screens/estado/estadoScreen1.dart';

class Estado1 extends StatelessWidget {
  static String routeName = "/estado1_page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        //key: const Key('signin1'),
        title: Text(
          "Estados de espírito",
          style: TextStyle(
            color: Colors.deepOrange[300],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepOrange[300],
      ),
      body: EstadoScreen1(),
    );


  }
}