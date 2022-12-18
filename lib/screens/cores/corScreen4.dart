import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
//import 'package:appsilva/screens/objetos/objeto1.dart';
import 'package:appsilva/screens/mainPage.dart';
import 'package:appsilva/apiMockUp.dart';
import 'package:appsilva/listAnswer.dart';
import 'package:appsilva/screens/cores/cor5.dart';
import 'package:appsilva/screens/cores/cor4.dart';
import 'package:appsilva/screens/objetos/objeto2.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CorScreen4 extends StatefulWidget {
  static String routeName = "/cor4_page";

  @override
  _Cor4FormState createState() => _Cor4FormState();
}

class _Cor4FormState extends State<CorScreen4> {
  late VideoPlayerController _controller16;
  late Future<void> _initializeVideoPlayerFuture;

  final _wordCorrectController = new TextEditingController();
  final List<String> errors = [];
  String? errorMessage;

  ApiMockUp apiMockUp = ApiMockUp();
  ListAnswer l = ListAnswer();
  late ListAnswer listAnswer = apiMockUp.l1;
  late int index;

  @override
  void initState() {
    _controller16 = VideoPlayerController.asset('assets/videos/cores/verde.mp4');
    _initializeVideoPlayerFuture = _controller16.initialize();

    _controller16.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller16.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child:Text(
                      "Nível 5",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.blue[300],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller16.value.aspectRatio,
                            child: VideoPlayer(_controller16),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(100),
                    height: getProportionateScreenHeight(56),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          // pause
                          if (_controller16.value.isPlaying) {
                            _controller16.pause();
                          } else {
                            // play
                            _controller16.play();
                          }
                        });
                      },
                      // icon
                      child: Icon(
                        _controller16.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                  ),

                  SizedBox(height: getProportionateScreenHeight(80)),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      // key: const Key('email'),
                      controller: _wordCorrectController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Resposta",
                        hintText: "Coloca a tua resposta",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: Icon(Icons.abc),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(120)),
                  SizedBox(
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenHeight(56),
                    child: ElevatedButton(
                      // key: const Key('signin'),
                      onPressed: () {
                        for (var answer in listAnswer.answers) {
                          if (_wordCorrectController.text ==
                              apiMockUp.l1.answers[18].resposta)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Cor5(),
                                ));
                        }
                        if (_wordCorrectController.text.isEmpty || _wordCorrectController.text != "verde"){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              content:
                              Container(
                                padding: const EdgeInsets.all(16),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.indigo[900],
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: const Text(
                                  "Por favor, coloca a resposta certa.",
                                  style: const TextStyle(
                                    fontSize: 17,

                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Colors.blue[300],
                      ),
                      child: Text(
                        'Continuar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(80)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }
}
