import 'package:flutter/material.dart';

class Launchpage extends StatelessWidget{
    const Launchpage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Center(
                child: Column(
                    children: [
                        Text('Welcome to the reaction app'),
                        TextButton(
                            onPressed: () {
                                Navigator.pushNamed(context, '/game');
                            },
                            child: Text('Start'),
                        ),
                    ],
                ),
            ),
        );
    }
}
