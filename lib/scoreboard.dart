import 'package:flutter/material.dart';

class Gamepage extends StatelessWidget{
    const Gamepage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Center(
                child: Container(
                    child: Text('Game'),
                ),
            ),
        );
    }
}
