import 'package:flutter/material.dart';

class Scoreboardpage extends StatefulWidget{
    final int? circleCounter;
    final int? time;

    Scoreboardpage(this.circleCounter, this.time);

    @override
    _ScoreboardpageState createState() => _ScoreboardpageState();
}

class _ScoreboardpageState extends State<Scoreboardpage>{
    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Center(
                child: Container(
                    child: Text('You have collected ${widget.circleCounter} circles in ${widget.time} seconds'),
                ),
            ),
        );
    }
}
