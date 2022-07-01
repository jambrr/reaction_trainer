import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scoreboardpage extends StatefulWidget {
  final int? circleCounter;
  final int? time;
  final List<String>? scores;

  Scoreboardpage(this.circleCounter, this.time, this.scores);

  @override
  _ScoreboardpageState createState() => _ScoreboardpageState();
}

class _ScoreboardpageState extends State<Scoreboardpage> {
  List<String>? scores;

  void initState() {
    setState(() {
      scores = widget.scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECE6FF),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Column(
                      children: [
                        Text(
                          'Your score',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20),
                        IntrinsicHeight(
                          child: Row(children: [
                            Column(children: [
                              Text(
                                '${widget.circleCounter}',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text('Circles'),
                            ]),
                            SizedBox(width: 20),
                            VerticalDivider(
                                color: Color(0xffD1C0FF), thickness: 0.5),
                            SizedBox(width: 20),
                            Column(children: [
                              Text(
                                '${widget.time}',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text('Time'),
                            ]),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                    ),
                    color: Colors.white,
                ),
                child: Column(
                    children: [
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                                'Scoreboard',
                                style: Theme.of(context).textTheme.headline1,
                            ),
                        ),
                        SizedBox(height: 20),
                        Center(
                            child: Container(
                                            width: 250,
                                            child: Row(
                                              children: [
                                                  Text(
                                                    'Rank',
                                                    style: Theme.of(context).textTheme.bodyText1,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'Circles',
                                                    style: Theme.of(context).textTheme.bodyText1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                        Expanded(
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 300, vertical: 20),
                                itemCount: this.scores!.length < 3 ? this.scores!.length : 3,
                                itemBuilder: (BuildContext context, int index) {
                                    return Center(
                                              child: Container(
                                                width: 200,
                                                child: Row(
                                                  children: [
                                                      Text(
                                                        '${index + 1}.',
                                                        style: Theme.of(context).textTheme.headline2,
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        '${widget.scores![index]}',
                                                        style: Theme.of(context).textTheme.headline2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                },
                                separatorBuilder: (BuildContext context, int index) =>
                                    const Divider(
                                  color: Color(0xffD1C0FF),
                                ),
                            ),
                        ),
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
