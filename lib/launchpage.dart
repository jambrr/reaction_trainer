import 'package:flutter/material.dart';

class Launchpage extends StatelessWidget{
    const Launchpage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Column(
                children: [
                    SizedBox(
                        height: 50,
                    ),
                    Text(
                       'App Title',
                       style: Theme.of(context).textTheme.headline1,
                    ),
                    Expanded(
                        child: Center(
                            child: Container(
                                width: 300,
                                height: 150,
                                child: Column(
                                    children: [
                                        Text(
                                            'Welcome\nTo play press \'Start\'', 
                                            textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                            height: 20,
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
                                                //Go to the game page
                                                Navigator.pushNamed(context, '/game');
                                            },
                                            child: Text(
                                                'Start',
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
                ],
            ),
        );
    }
}
