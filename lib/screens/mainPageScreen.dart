import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:appsilva/screens/animal1.dart';

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
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(56),
                      child: ElevatedButton(
                        //key: const Key('signin'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Animal1(/*apiMockUpAccounts*/),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.indigo[900],
                        ),
                        child: Text(
                          'Animais',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,

                          ),
                          ),

                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    /*IconButton(
                      icon: Image.asset('images/comidaIcon.png'),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Comida(/*apiMockUpAccounts*/),
                            ));
                      },
                    ),*/
                    SizedBox(
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(100),
                      child: InkWell (
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Animal1(/*apiMockUpAccounts*/),
                               ));
                         },
                        child: Row (
                          mainAxisSize: MainAxisSize.min,
                           children: [
                             Ink.image(
                                 image: AssetImage('images/food.jpg')),
                             //SizedBox(height: getProportionateScreenHeight(50)),
                             /*Text(
                                'Comida',
                                 style: TextStyle(fontSize: getProportionateScreenWidth(18)),
                              ),*/
                             //SizedBox(height: getProportionateScreenHeight(2)),

                       ],
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
    );
  }

}
