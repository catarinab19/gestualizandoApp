import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:appsilva/screens/mainPageScreen.dart';
import 'package:appsilva/screens/cores/corScreen4.dart';
import 'package:appsilva/screens/cores/cor3.dart';

class Cor4 extends StatelessWidget {
  static String routeName = "/cor4_page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        //key: const Key('signin1'),
        title: Text(
          "Cores",
          style: TextStyle(
            color: Colors.blue[300],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue[300],
      ),
      body: CorScreen4(),
    );


  }
}