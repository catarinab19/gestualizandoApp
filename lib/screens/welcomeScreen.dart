import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/screens/signIn.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:appsilva/screens/signUp.dart';

class WelcomeScreen extends StatelessWidget {
  //ApiMockUp apiMockUpAccounts = ApiMockUp();
  static String routeName = '/welcome-screen';

  WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Material(
        key: const Key('welcome1'),
        type: MaterialType.transparency,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        "Gestualizando",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(40),
                          color: Colors.blueGrey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text('Welcome!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(15),
                              color: Colors.blueGrey[400])),
                      const Spacer(
                        flex: 1,
                      ),
                      /*Image.asset(
                        'assets/images/welcome.png',
                        height: getProportionateScreenHeight(250),
                        width: getProportionateScreenWidth(300),
                      ),*/
                    ],
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Spacer(
                        flex: 2,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(200),
                        height: getProportionateScreenHeight(56),
                        child: ElevatedButton(
                          key: const Key('welcome'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignIn(/*apiMockUpAccounts*/),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: Colors.blueGrey[700],
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(15),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      SizedBox(
                        width: getProportionateScreenWidth(200),
                        height: getProportionateScreenHeight(56),
                        child: ElevatedButton(
                          key: const Key('welcome'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(/*apiMockUpAccounts*/),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: Colors.blueGrey[700],
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(15),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}