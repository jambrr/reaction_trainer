// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({Key? key}) : super(key: key);

  @override
  _Gamepage createState() => _Gamepage();
}

class _Gamepage extends State<Gamepage> {
  Timer? _timer;
  int _circleCounter = 0;
  int _countdown = 10;
  int _time = 10;
  int _startCountdown = 3;
  int _xPosition = 0;
  int _yPosition = 0;
  Widget? currentCircle;

  void gameTimer() async {
    final prefs = await SharedPreferences.getInstance();
    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_countdown < 1) {
            timer.cancel();
            if (prefs.getStringList('scoreboard') != null) {
              List<String>? list = prefs.getStringList('scoreboard');
              list!.add(_circleCounter.toString());

              //convert list to int list
              List<int> intList = list.map((e) => int.parse(e)).toList();

              //sort the list
              intList = intList.toSet().toList();
              intList.sort();

              //convert the list back to string list
              List<String> stringList =
                  intList.map((e) => e.toString()).toList();

              //store the list
              prefs.setStringList(
                  'scoreboard', new List.from(stringList.reversed));
            } else {
              print('null');
              prefs.setStringList(
                  'scoreboard', <String>[_circleCounter.toString()]);
            }
            Navigator.pushNamed(context, '/scoreboard', arguments: {
              'circleCounter': this._circleCounter,
              'time': this._time,
              'scores': prefs.getStringList('scoreboard')
            });
          } else {
            _countdown = _countdown - 1;
          }
        },
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_startCountdown == 1) {
            changeLocation();
            currentCircle = circle();
            gameTimer();
          }
          if (_startCountdown == 0) {
            timer.cancel();
          } else {
            _startCountdown = _startCountdown - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    startTimer();
  }

  Widget circle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _circleCounter++;
          changeLocation();
        });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xff9332CA),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  void changeLocation() {
    int screenWidth = MediaQuery.of(context).size.width.toInt();
    int screenHeight = MediaQuery.of(context).size.height.toInt();
    print('width: ${screenWidth}');
    print('width: ${screenHeight}');
    int padding = 140;
    var random = new Random();

    setState(() {
      _xPosition = padding + random.nextInt((screenWidth - padding) - padding);
      print(_xPosition);
      _yPosition = padding + random.nextInt((screenHeight - padding) - padding);
      print(_yPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            (_startCountdown != 0)
                ? Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffECE6FF),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.all(30),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'Game starts in:',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${_startCountdown}',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          '${_circleCounter}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '${_countdown}s',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: _yPosition.toDouble(),
                          left: _xPosition.toDouble(),
                          child: (currentCircle != null)
                              ? currentCircle!
                              : Container(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
