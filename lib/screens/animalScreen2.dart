import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appsilva/widgets/sizeConfig.dart';
import 'package:appsilva/screens/animal2.dart';
import 'package:appsilva/screens/mainPage.dart';
import 'package:appsilva/apiMockUp.dart';
import 'package:appsilva/listAnswer.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AnimalScreen2 extends StatefulWidget {
  static String routeName = "/animal2_page";

  //ComidaScreen({Key key}) : super(key: key);

  @override
  _Animal2FormState createState() => _Animal2FormState();
}

class _Animal2FormState extends State<AnimalScreen2> {
  late VideoPlayerController _controller;
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
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

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
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
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
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // play
                            _controller.play();
                          }
                        });
                      },
                      // icon
                      child: Icon(
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
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
                      onSaved: (value) {
                        _wordCorrectController.text = value!;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: 'Por favor coloca a tua resposta');
                        }
                        return null;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: "Por favor coloca a tua resposta");
                          return "Por favor coloca a tua resposta";
                        }
                        return null;
                      },
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
                          if(_wordCorrectController.text == answer.resposta)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(/*apiMockUpAccounts*/),
                                ));
                          else {
                            addError(error: "Por favor coloca a tua resposta");
                          }
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


