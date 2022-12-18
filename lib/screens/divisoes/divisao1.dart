import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:appsilva/screens/mainPageScreen.dart';
import 'package:appsilva/screens/divisoes/divisaoScreen1.dart';
import 'package:appsilva/screens/divisoes/divisao2.dart';

class Divisao1 extends StatelessWidget {
  static String routeName = "/divisao1_page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        //key: const Key('signin1'),
        title: Text(
          "Divisões",
          style: TextStyle(
            color: Colors.indigo[300],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[300],
      ),
      body: DivisaoScreen1(),
    );


  }
}