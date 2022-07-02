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
    print(scores);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECE6FF),
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
                        const SizedBox(height: 20),
                        IntrinsicHeight(
                          child: Row(children: [
                            Column(children: [
                              Text(
                                '${widget.circleCounter}',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              const Text('Circles'),
                            ]),
                            const SizedBox(width: 20),
                            const VerticalDivider(
                                color: Color(0xffD1C0FF), thickness: 0.5),
                            const SizedBox(width: 20),
                            Column(children: [
                              Text(
                                '${widget.time}',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              const Text('Time'),
                            ]),
                          ]),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                // Change your radius here
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text(
                            'Go to homescreen',
                            style: TextStyle(
                              color: Color(0xff31274C),
                            ),
                          ),
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
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
                        itemCount:
                            this.scores!.length < 3 ? this.scores!.length : 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  Text(
                                    '${index + 1}.',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  Spacer(),
                                  Text(
                                    '${widget.scores![index]}',
                                    style:
                                        Theme.of(context).textTheme.headline2,
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
