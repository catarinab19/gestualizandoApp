import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:appsilva/widgets/navBar.dart';
import 'package:appsilva/widgets/menuState.dart';
import 'package:appsilva/screens/mainPage.dart';

class FinalScreen extends StatelessWidget {
  static String routeName = '/final-screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Material(
        // key: const Key('welcome1'),
        type: MaterialType.transparency,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: getProportionateScreenHeight(100)),
                    Text(
                      "Parabéns, nível 7 completo!",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.pink[300],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(80)),
                    SizedBox(
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(56),
                      child: ElevatedButton(
                        // key: const Key('welcome'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(/*apiMockUpAccounts*/),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          primary: Colors.pink[600],
                        ),
                        child: Text(
                          'Voltar para categorias',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(15),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}