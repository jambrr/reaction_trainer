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
                child: Column(
                    children: [
                        Text('Your score'),
                        IntrinsicHeight(
                            child: Row(
                                children: [
                                    Column(
                                        children: [
                                            Text(
                                                '${widget.circleCounter}',
                                                style: Theme.of(context).textTheme.headline1,
                                            ),
                                            Text('Circles'),
                                        ]
                                    ),
                                    VerticalDivider(
                                        color: Color(0xffD1C0FF),
                                        thickness: 0.5
                                    ),
                                    Column(
                                        children: [
                                            Text(
                                                '${widget.time}',
                                                style: Theme.of(context).textTheme.headline1,
                                            ),
                                            Text('Time'),
                                        ]
                                    ),
                                ]
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
