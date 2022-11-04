import 'dart:async';
//import 'dart:io';
//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:vibration/vibration.dart';
import 'package:gap/gap.dart';
import 'package:animate_gradient/animate_gradient.dart';

//import 'package:flutter_beautiful_popup/main.dart';
String backdrop = 'graphicsApp/vibeBackground2c.png';
String Mode = "M";
int waitTime = 500;
bool ok = true;
// ignore: deprecated_member_use
List<int> recordList = new List<int>.filled(1, 0, growable: true);

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Widget build(BuildContext context) {
    return MaterialApp(home: _Home());
  }
}

class _Home extends StatelessWidget {
  bool firstit = true;
  Stopwatch stopwatch = Stopwatch();
  Stopwatch Pausewatch = Stopwatch();
  int delay = 0;
  int pressed = 0;
  final Timer clk = Timer(
    const Duration(minutes: 10),
    () {},
  );
  int i = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            //backgroundColor: Color.fromARGB(255, 255, 204, 0),
            body: Center(
      child: GestureDetector(
        child: Container(
            child: Stack(children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: GestureDetector(
                  child: Container(
                    color: Color.fromARGB(0, 0, 0, 0),
                    height: 2732,
                    width: 35,
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
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  child: Container(
                    color: Color.fromARGB(0, 250, 0, 0),
                    height: 2732,
                    width: 35,
                  ),
                  onTap: () {
                    Vibration.cancel();
                    print("red");
                    R_action();
                    firstit = true;
                    recordList.clear();
                  },
                ),
              )
            ]),
            height: 2732,
            width: 2048,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backdrop),
                fit: BoxFit.fill,
                //scale: 0.8
              ),
            )),
        onTap: () {
          if (Mode == "M") {
            action(1);
          } else if (Mode == "R") {
            recordList.add(90);

            if (!firstit) {
              Pausewatch.stop();
              delay = Pausewatch.elapsedMilliseconds;
              if (delay <= 10) {
                delay = 25;
              }
              Pausewatch.reset();
              recordList.add(delay);
            }

            if (firstit) {
              firstit = false;
            }

            Pausewatch.start();
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
        onLongPressDown: (details) {
          if (Mode == "M") {
            action(2);
          } else if (Mode == "R") {
            if (!firstit) {
              Pausewatch.stop();
              delay = Pausewatch.elapsedMilliseconds;
              if (delay <= 10) {
                delay = 25;
              }
              Pausewatch.reset();
            }
            print("mf");
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
      ),
    )));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimateGradient(
          /* primaryBegin: Alignment.topLeft,
       primaryEnd: Alignment.topRight,
       secondaryBegin: Alignment.topRight,
       secondaryEnd: Alignment.topLeft,*/
          primaryColors: const [
            Color.fromARGB(255, 128, 0, 139),
            Color.fromARGB(255, 154, 0, 172),
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
            Color.fromARGB(255, 154, 0, 172),
            Color.fromARGB(255, 128, 0, 139),
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
                  Gap(150),
                  SizedBox(
                      height: 80, //height of button
                      width: 115, //width of button
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 133, 228),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text("Mimic"),
                          onPressed: () {
                            Mode = "M";
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _Home()),
                            );
                          })),
                  Gap(150),
                  SizedBox(
                      height: 80, //height of button
                      width: 115, //width of button
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 133, 228),
                            elevation: 0,
                            
                            shape: RoundedRectangleBorder(

                                //to set border radius to button
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text("Record"),
                          onPressed: () {
                            Mode = "R";
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _Home()),
                            );
                          })),
                  Gap(150),
                  SizedBox(
                      height: 80, //height of button
                      width: 115, //width of button
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 133, 228),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text("Forever"),
                          onPressed: () {
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

class timer {
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
}
