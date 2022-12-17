import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:appsilva/screens/animais/animal3.dart';
import 'package:appsilva/screens/mainPage.dart';
import 'package:appsilva/apiMockUp.dart';
import 'package:appsilva/listAnswer.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AnimalScreen3 extends StatefulWidget {
  static String routeName = "/animal3_page";

  //ComidaScreen({Key key}) : super(key: key);

  @override
  _Animal3FormState createState() => _Animal3FormState();
}

class _Animal3FormState extends State<AnimalScreen3> {
  late VideoPlayerController _controller3;
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
    _controller3 = VideoPlayerController.asset('assets/videos/animais/gato.mp4');
    _initializeVideoPlayerFuture = _controller3.initialize();

    _controller3.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller3.dispose();

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
                      "Nível 1",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child:FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller3.value.aspectRatio,
                            child: VideoPlayer(_controller3),
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
                          if (_controller3.value.isPlaying) {
                            _controller3.pause();
                          } else {
                            // play
                            _controller3.play();
                          }
                        });
                      },
                      // icon
                      child: Icon(
                        _controller3.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                    ),

                  ),
                  SizedBox(height: getProportionateScreenHeight(80)),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      key: const Key('email'),
                      controller: _wordCorrectController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Resposta",
                        hintText: "Coloca tua resposta",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: Icon(Icons.abc),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(120)),
                  SizedBox(
                    width: getProportionateScreenWidth(100),
                    height: getProportionateScreenHeight(56),
                    child: ElevatedButton(
                      // key: const Key('signin'),
                      onPressed: () {
                        for (var answer in listAnswer.answers) {
                          if(_wordCorrectController.text == apiMockUp.l1.answers[2].resposta)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Animal3(/*apiMockUpAccounts*/),
                                ));
                          else if (_wordCorrectController.text !=
                              apiMockUp.l1.answers[0].resposta && _wordCorrectController.text.isNotEmpty){
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
                                    "Resposta errada! Tenta novamente :)",
                                    style: const TextStyle(
                                      fontSize: 17,

                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                        if (_wordCorrectController.text.isEmpty){
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
                                  "Por favor, coloca uma resposta.",
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
                        primary: Colors.indigo[900],
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

