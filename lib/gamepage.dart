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
    double _xPosition = 0;
    double _yPosition = 0;

    void startTimer(){
        const oneSec = const Duration(seconds: 1);
        _timer = new Timer.periodic(
            oneSec,
            (Timer timer) => setState(
                (){
                    if(_countdown < 1){
                        timer.cancel();
                    }else{
                        _countdown = _countdown - 1;
                    }
                },
            ),
        );
    }

    void initState(){
        startTimer();
    }

    Widget circle(){
        return Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
            ),
        );
    }

    void spawnNewCircle(){
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        var random = new Random();

        setState((){
            _xPosition = random.nextDouble() * screenWidth;
            _yPosition = random.nextDouble() * screenHeight;
        });
    }

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Center(
                child: Column(
                    children: [
                        Row(
                            children: [
                                Text('${_circleCounter}'),
                                Text('${_countdown}'),
                            ],
                        ),
                        Expanded(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.blue,
                                    child: Stack(
                                        children: [
                                            Positioned(
                                                top: _xPosition,
                                                left: _yPosition,
                                                child: circle(),
                                            )
                                        ],
                                    ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
