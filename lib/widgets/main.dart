import 'package:appsilva/screens/signIn.dart';
import 'package:appsilva/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:appsilva/screens/signUp.dart';
import 'package:appsilva/screens/forgotPassword.dart';
import 'package:appsilva/screens/mainPage.dart';
import 'package:appsilva/screens/animais/animal1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:appsilva/screens/animais/animal2.dart';
import 'package:appsilva/screens/transports/transporte1.dart';
import 'package:appsilva/screens/objetos/objeto1.dart';

import 'package:appsilva/screens/artigos.dart';
import 'package:appsilva/screens/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB8NaN5Tkb_WDs2GNsQR-IBEG_oocekJE0",
      appId: "1:1059827376484:android:516c059d28dbd326bbda71",
      messagingSenderId: "XXX",
      projectId: "1059827376484",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Gestualizando',
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        SignIn.routeName: (context) => SignIn(),
        MainPage.routeName: (context) => MainPage(),
        SignUp.routeName: (context) => SignUp(),
        Animal1.routeName: (context) => Animal1(),
        Profile.routeName: (context) => Profile(),
        ForgotPassword.routeName: (context) => ForgotPassword(),
        Artigos.routeName: (context) => Artigos(),
        Transporte1.routeName: (context) => Transporte1(),
        Objeto1.routeName: (context) => Objeto1(),
      },
      initialRoute: WelcomeScreen.routeName,
    );
  }
}