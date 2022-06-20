import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Gamepage extends StatefulWidget{
    const Gamepage({Key? key}) : super(key: key);

    @override
    _Gamepage createState() => _Gamepage();
}

class _Gamepage extends State<Gamepage>{
    Timer? _timer;
    int _circleCounter = 0;
    int _countdown = 10;
    int _time = 10;
    int _startCountdown = 3;
    double _xPosition = 0;
    double _yPosition = 0;
    Widget? currentCircle;

    void gameTimer(){
        const oneSec = const Duration(seconds: 1);
        _timer = new Timer.periodic(
            oneSec,
            (Timer timer) => setState(
                (){
                    if(_countdown < 1){
                        timer.cancel();
                        Navigator.pushNamed(context, '/scoreboard', arguments:{'circleCounter': this._circleCounter, 'time': this._time});
                    }else{
                        _countdown = _countdown - 1;
                    }
                },
            ),
        );
    }
    void startTimer(){
        const oneSec = const Duration(seconds: 1);
        _timer = new Timer.periodic(
            oneSec,
            (Timer timer) => setState(
                (){
                    if(_startCountdown == 1){
                        currentCircle = circle();
                        gameTimer();
                    }
                    if(_startCountdown == 0){
                        timer.cancel();
                    }else{
                        _startCountdown = _startCountdown - 1;
                    }
                },
            ),
        );
    }

    void initState(){
        startTimer();
    }

    Widget circle(){
        return GestureDetector(
            onTap: (){
                setState((){
                    _circleCounter++;
                    changeLocation();
                });
            },
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                ),
            ),
        );
    }

    void changeLocation(){
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        int padding = 100;
        var random = new Random();

        setState((){
            _xPosition = random.nextDouble() * ((screenWidth-padding) - padding) + padding;
            _yPosition = random.nextDouble() * ((screenHeight-padding) - padding) + padding;
        });
    }

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Center(
                child: Stack(
                    children: [
                        (_startCountdown != 0)?
                            Center(
                                child: Container(
                                    color: Colors.red,
                                    padding: EdgeInsets.all(30),
                                    child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Column(
                                            children: [
                                                Text('Game starts in: '),
                                                Text('${_startCountdown}'),
                                            ],
                                        ),
                                    ),
                                ),
                        ): Container(),
                        Column(
                            children: [
                                Row(
                                    children: [
                                        Expanded(
                                            child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Center(
                                                    child: Text('${_circleCounter}'),
                                                ),
                                            ),
                                        ),
                                        Expanded(
                                            child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Center(
                                                    child: Text('${_countdown}s'),
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
                                                    top: _xPosition,
                                                    left: _yPosition,
                                                    child: (currentCircle != null)?
                                                        currentCircle!: Container(),
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
