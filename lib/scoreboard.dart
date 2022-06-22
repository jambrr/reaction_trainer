import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scoreboardpage extends StatefulWidget{
    final int? circleCounter;
    final int? time;
    final List<String>? scores;

    Scoreboardpage(this.circleCounter, this.time, this.scores);

    @override
    _ScoreboardpageState createState() => _ScoreboardpageState();
}

class _ScoreboardpageState extends State<Scoreboardpage>{
    List<String>? scores;

    void initState(){
        print(widget.scores);
    }

    void getScores() async{
        
    }

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
                        Container(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: widget.scores!.length,
                                itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                        height: 50,
                                        color: Colors.amber[100],
                                        child: Center(child: Text('Entry ${widget.scores![index]}')),
                                    );
                                },
                            ),
                       ),
                    ],
                ),
            ),
        );
    }
}
