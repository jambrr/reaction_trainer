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
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Container(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount:
                        this.scores!.length < 3 ? this.scores!.length : 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Container(
                          width: 200,
                          color: Colors.red,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${index + 1}.',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${widget.scores![index]}',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
