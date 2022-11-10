// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import "dart:ui";
import 'dart:math';
import "dart:isolate";

//import 'package:flutter_p2p/flutter_p2p.dart';

import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/flutter_launcher_icons_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_launcher_icons/flutter_launcher_icons_config.g.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/logger.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/pubspec_parser.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:flutter_launcher_icons/web/web_template.dart';
import 'package:flutter_launcher_icons/windows/windows_icon_generator.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:vibration/vibration.dart';
import 'package:gap/gap.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:simple_animations/simple_animations.dart';

//import 'package:flutter_beautiful_popup/main.dart';
String backdrop = 'graphicsApp/vibeBackground2c.png';
String Titlegif = 'graphicsApp/GoodVibesColored.gif';
String Mode = "M";
int waitTime = 500;
bool ok = true;
var posx;
var posy;
bool GlobalShow = false;
bool GlobalShowConnect = false;

//Offset _tapPosition;
// ignore: deprecated_member_use
List<int> recordList = new List<int>.filled(1, 0, growable: true);

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Widget build(BuildContext context) {
    return MaterialApp(home: OpeningTitle());
  }
}

class _Home extends StatefulWidget {
  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  bool firstit = true;

  Stopwatch stopwatch = Stopwatch();

  Stopwatch Pausewatch = Stopwatch();

  Stopwatch Controlwatch = Stopwatch();

  int delay = 0;

  int delayTp = 0;

  int pressed = 0;

  bool Ontap = false;

  final Timer clk = Timer(
    const Duration(minutes: 10),
    () {},
  );

  int i = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
            //backgroundColor: Color.fromARGB(255, 255, 204, 0),
            body: Center(
                child: GestureDetector(
      child: AnimateGradient(
        /* primaryBegin: Alignment.topCenter,
       primaryEnd: Alignment.centerRight,
      secondaryBegin: Alignment.centerLeft,
       secondaryEnd: Alignment.bottomCenter,*/
        primaryColors: const [
          //Color.fromARGB(255, 128, 0, 139),
          //Color.fromARGB(255, 154, 0, 172),
          Color.fromARGB(255, 177, 0, 226),
          Color.fromARGB(255, 255, 66, 252),
          Color.fromARGB(255, 246, 141, 255),
          Color.fromARGB(255, 250, 128, 219),
          Color.fromARGB(255, 255, 188, 246),
        ],
        secondaryColors: const [
          Color.fromARGB(255, 255, 188, 246),
          Color.fromARGB(255, 255, 151, 229),
          Color.fromARGB(255, 246, 141, 255),
          Color.fromARGB(255, 255, 66, 252),
          Color.fromARGB(255, 177, 0, 226),
          // Color.fromARGB(255, 154, 0, 172),
          //Color.fromARGB(255, 128, 0, 139),
        ],
        child: Container(
          child: Stack(children: [
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 9, 13),
                  child: GestureDetector(
                    child: Container(
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'M',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // shadows:[Shadow(color: Color.fromARGB(255, 108, 0, 106), offset: Offset(2,1), blurRadius:10)],
                                color: Color.fromARGB(150, 255, 255, 255),
                                fontSize: 25,
                                fontFamily: 'Alba'),
                          )),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Color.fromARGB(15, 111, 0, 87),
                                offset: Offset.fromDirection(10),
                                blurStyle: BlurStyle.outer)
                          ],
                          border: Border.all(
                              color: Color.fromARGB(0, 255, 151, 229)),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(23),
                              bottomRight: Radius.circular(23),
                              topLeft: Radius.circular(23),
                              bottomLeft: Radius.circular(23)),
                          color: Color.fromARGB(40, 255, 162, 232)),
                      //color: Color.fromARGB(255, 0, 0, 0),
                      height: 55,
                      width: 55,
                    ),
                    onTap: () {
                      print("black");
                      Vibration.cancel();
                      recordList.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                )),
            Visibility(
                visible: GlobalShow,
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 75),
                    child: GestureDetector(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'R',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // shadows:[Shadow(color: Color.fromARGB(255, 108, 0, 106), offset: Offset(2,1), blurRadius:10)],
                                color: Color.fromARGB(150, 255, 255, 255),
                                fontSize: 25,
                                fontFamily: 'Alba'),
                          ),
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Color.fromARGB(15, 111, 0, 87),
                                  offset: Offset.fromDirection(10),
                                  blurStyle: BlurStyle.outer)
                            ],
                            border: Border.all(
                                color: Color.fromARGB(0, 255, 151, 229)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                                topLeft: Radius.circular(23),
                                bottomLeft: Radius.circular(23)),
                            color: Color.fromARGB(40, 255, 162, 232)),
                        height: 55,
                        width: 55,
                      ),
                      onTap: () {
                        Vibration.cancel();
                        print("red");
                        R_action();
                        Pausewatch.reset();
                        firstit = true;
                        recordList.clear();
                      },
                    ),
                  ),
                )),
            /*Visibility(
                visible: GlobalShowConnect,
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 75),
                    child: GestureDetector(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // shadows:[Shadow(color: Color.fromARGB(255, 108, 0, 106), offset: Offset(2,1), blurRadius:10)],
                                color: Color.fromARGB(150, 255, 255, 255),
                                fontSize: 25,
                                fontFamily: 'Alba'),
                          ),
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Color.fromARGB(15, 111, 0, 87),
                                  offset: Offset.fromDirection(10),
                                  blurStyle: BlurStyle.outer)
                            ],
                            border: Border.all(
                                color: Color.fromARGB(0, 255, 151, 229)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                                topLeft: Radius.circular(23),
                                bottomLeft: Radius.circular(23)),
                            color: Color.fromARGB(40, 255, 162, 232)),
                        height: 55,
                        width: 55,
                      ),
                      onTap: () {
                        Vibration.cancel();
                        print("blue");
                        R_action();
                        Pausewatch.reset();
                        firstit = true;
                        recordList.clear();
                      },
                    ),
                  ),
                ))*/
          ]),
          height: 2732,
          width: 2048,
          alignment: Alignment.center,
          /*decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backdrop),
                fit: BoxFit.fill,
                //scale: 0.8
              ),
            )*/
        ),
      ),
      onTapDown: (TapDownDetails details) {
        var position = details.globalPosition;
        //print(position);
        //print("eosfsfsf");
        posx = position.dx;
        posy = position.dy;
        //Particlegen p = Particlegen(posx, posy);
        //p.run();
        /*final RenderObject referenceBox = context.findRenderObject();
        setState(() {
          _tapPosition = referenceBox.globalToLocal(details.globalPosition);
        });*/
      },
      onTap: () {
        if (Mode == "M") {
          action(1);
        } else if (Mode == "R") {
          Ontap = true;
          recordList.add(90);

          if (!firstit) {
            Pausewatch.stop();
            delayTp = Pausewatch.elapsedMilliseconds;
            print(delayTp);
            if (delayTp <= 10) {
              delayTp = 25;
            }
            recordList.add(delayTp);
            Pausewatch.reset();
          }

          if (firstit) {
            recordList.add(0);
            firstit = false;
          }
          Pausewatch.start();
          print(recordList);
          Ontap = false;
        } else if (Mode == "L") {
          if (pressed % 2 == 0) {
            print(pressed);
            pressed += 1;
            ok = true;
            loopVibrate(clk);
          } else {
            //clk.cancel();
            ok = false;
            Vibration.cancel();
            print(pressed);
            pressed += 1;
          }
        }
      },
      onLongPressDown: (details) {
        Controlwatch.start();
        int c = 0;
        if (Mode == "M") {
          action(2);
        } else if (Mode == "R") {
          if (!firstit) {
            Pausewatch.stop();
            delay = Pausewatch.elapsedMilliseconds;
            if (delay <= 10) {
              delay = 25;
            }
            if (!Ontap) {
              //Pausewatch.reset();
              print("mofof");
            }
          }

          if (firstit) {
            firstit = false;
          }
          stopwatch.reset();
          //clock.startCount();
          stopwatch.start();
        } else if (Mode == "L") {}
      },
      onLongPressUp: () {
        if (Mode == "M") {
          Vibration.cancel();
        } else if (Mode == "R") {
          Pausewatch.reset();
          stopwatch.stop();
          var lenghtVibe = stopwatch.elapsedMilliseconds;
          stopwatch.reset();
          //var lenghtVibe = clock.getTime();
          if (lenghtVibe > 10000) {
            lenghtVibe = 10000;
          }
          recordList.add(lenghtVibe);

          if (!firstit) {
            recordList.add(delay);
            Pausewatch.reset();
            Pausewatch.reset();
          }
          Pausewatch.start();

          //clock.reset();
          //print(lenghtVibe);
          print(recordList);
        } else if (Mode == "L") {
          if (pressed % 2 == 0) {
            print(pressed);
            pressed += 1;
            ok = true;
            loopVibrate(clk);
          } else {
            //clk.cancel();
            ok = false;
            Vibration.cancel();
            print(pressed);
            pressed += 1;
          }
        }
      },
    ))));
  }
}

class OpeningTitle extends StatelessWidget {
  const OpeningTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      child: Container(
          decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Titlegif),
          fit: BoxFit.fitHeight,
          //scale: 0.8
        ),
      )),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _Home()),
        );
      },
    ));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double gap = ((height / 3) / 2 - 40);
    print(gap);
    return Scaffold(
      body: Center(
        child: AnimateGradient(
          /* primaryBegin: Alignment.topLeft,
       primaryEnd: Alignment.topRight,
       secondaryBegin: Alignment.topRight,
       secondaryEnd: Alignment.topLeft,*/
          primaryColors: const [
            // Color.fromARGB(255, 128, 0, 139),
            //Color.fromARGB(255, 154, 0, 172),
            Color.fromARGB(255, 177, 0, 226),
            Color.fromARGB(255, 255, 66, 252),
            Color.fromARGB(255, 246, 141, 255),
            Color.fromARGB(255, 250, 128, 219),
            Color.fromARGB(255, 255, 188, 246),
          ],
          secondaryColors: const [
            Color.fromARGB(255, 255, 188, 246),
            Color.fromARGB(255, 255, 151, 229),
            Color.fromARGB(255, 246, 141, 255),
            Color.fromARGB(255, 255, 66, 252),
            Color.fromARGB(255, 177, 0, 226),
            // Color.fromARGB(255, 154, 0, 172),
            //Color.fromARGB(255, 128, 0, 139),
          ],
          child: Container(
            height: 2732,
            width: 2000,
            // color: Color.fromARGB(0, 0, 0, 0),
            /*decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              //Color.fromARGB(255, 121, 0, 109),
              Color.fromARGB(255, 128, 0, 139),
              Color.fromARGB(255, 154, 0, 172),
              Color.fromARGB(255, 177, 0, 226),
              Color.fromARGB(255, 255, 66, 252),
              Color.fromARGB(255, 246, 141, 255),
              Color.fromARGB(255, 255, 151, 229),
            ],
          )

              /*image: DecorationImage(
            image: AssetImage(backdrop),
            fit: BoxFit.fill,
            //scale: 0.8
          )*/
              ),*/
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(gap),
                  SizedBox(
                      height: 80, //height of button
                      width: 115, //width of button
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(120, 255, 156, 234),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(22)),
                          ),
                          child: const Text("Mimic",
                              style: TextStyle(
                                  // shadows:[Shadow(color: Color.fromARGB(255, 108, 0, 106), offset: Offset(2,1), blurRadius:10)],
                                  color: Color.fromARGB(150, 255, 255, 255),
                                  letterSpacing: 0.9,
                                  fontSize: 22,
                                  fontFamily: 'Alba')),
                          onPressed: () {
                            GlobalShow = false;
                            Mode = "M";
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _Home()),
                            );
                          })),
                  Gap(2 * gap),
                  SizedBox(
                      height: 80, //height of button
                      width: 115, //width of button
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(120, 255, 156, 234),
                            elevation: 0,
                            shape: RoundedRectangleBorder(

                                //to set border radius to button
                                borderRadius: BorderRadius.circular(22)),
                          ),
                          child: const Text("Record",
                              style: TextStyle(
                                  // shadows:[Shadow(color: Color.fromARGB(255, 108, 0, 106), offset: Offset(2,1), blurRadius:10)],
                                  color: Color.fromARGB(150, 255, 255, 255),
                                  letterSpacing: 0.9,
                                  fontSize: 22,
                                  fontFamily: 'Alba')),
                          onPressed: () {
                            GlobalShow = true;
                            Mode = "R";
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _Home()),
                            );
                          })),
                  Gap(2 * gap),
                  SizedBox(
                      height: 80, //height of button
                      width: 115, //width of button
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(120, 255, 156, 234),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(22)),
                          ),
                          child: const Text("Forever",
                              style: TextStyle(
                                  // shadows:[Shadow(color: Color.fromARGB(255, 108, 0, 106), offset: Offset(2,1), blurRadius:10)],
                                  color: Color.fromARGB(150, 255, 255, 255),
                                  letterSpacing: 0.9,
                                  fontSize: 22,
                                  fontFamily: 'Alba')),
                          onPressed: () {
                            GlobalShow = false;
                            Mode = "L";
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _Home()),
                            );
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void action(int i) {
  if (i == 1) {
    Vibration.vibrate(duration: 100);
  } else if (i == 2) {
    Vibration.vibrate(duration: 10000);
  }
  print("tap");
}

void loopVibrate(Timer t) {
  double infinity = 1.0 / 0.0;
  //Vibration.vibrate(pattern: [10000], repeat: 100);

  /*while(flag){

  }*/
  Vibration.vibrate(duration: 10000);
  //print("bo sto qui");
  const dur = Duration(milliseconds: 10001);
  Timer.periodic(dur, (timer) {
    if (!ok) {
      print(t.isActive);
      timer.cancel();
      Vibration.cancel();
      //ok = false;
    }
    if (ok) {
      print(t.isActive);
      Vibration.vibrate(duration: 10000);
      print("op");
    }
  });
}

class _timer {
  int firstvalue = 0;
  int secondvalue = 0;
  void startCount() {
    firstvalue = DateTime.now().microsecondsSinceEpoch;
  }

  int getTime() {
    secondvalue = DateTime.now().microsecondsSinceEpoch;
    print(secondvalue - firstvalue);
    return secondvalue - firstvalue;
  }

  void reset() {
    firstvalue = 0;
    secondvalue = 0;
  }
}

void R_action() {
  /*for (int i in recordList) {
    Vibration.vibrate(duration: i);
    print("vibrated for " + i.toString());
  }*/
  recordList = prepareList(recordList);
  print(recordList);
  Vibration.vibrate(pattern: recordList);
  print("Fuck Kilian");
}

List<int> prepareList(List<int> l) {
  int a;
  int b;
  int counter = 0;
  List<int> modified = l;
  for (int i = 0; i < modified.length; i += 1) {
    if (counter % 2 != 0) {
      if (i % 2 != 0) {
        a = modified[i - 1];
        b = modified[i];
        modified[i - 1] = b;
        modified[i] = a;
      }
    }
    counter += 1;
  }
  return modified;
}

class Particlegen {
  var coorx;
  var coory;
  bool flag = true;

  Particlegen(var x, var y) {
    coorx = x;
    coory = y;
  }
  void run() async {
    Isolate.spawn(body, "");
  }

  void body(String st) {
    while (true) {
      if (!flag) {
        break;
      }
    }
  }

  void stop() {
    flag = false;
  }
}








/*
final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Color.fromARGB(221, 0, 255, 255),
  minimumSize: Size(100, 100),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

class FloatingText extends AnimatedText {
  //FloatingText animation;
  String text;
  TextStyle style;
  int fontSize;
  FontWeight fontWeight;
  Duration speed;
  FloatingText(
      this.style, this.fontSize, this.fontWeight, this.speed, this.text)
      : super(text: text, duration: speed) {}

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    // TODO: implement animatedBuilder
    throw UnimplementedError();
  }

  @override
  void initAnimation(AnimationController controller) {
    // TODO: implement initAnimation
  }
}*/
/*
class ParticleModel {
  Animatable tween;
  double size;
  AnimationProgress animationProgress;
  Random random;

  ParticleModel(this.random) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);
    final duration = Duration(milliseconds: 500 + random.nextInt(1000));

    tween = MultiTween([
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
          curve: Curves.easeInOutSine),
      Track("y").add(
          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
          curve: Curves.easeIn),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + random.nextDouble() * 0.4;
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}*/
