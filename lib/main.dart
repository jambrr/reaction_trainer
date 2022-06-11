import 'package:flutter/material.dart';
import 'package:reaction_trainer/launchpage.dart';
import 'package:reaction_trainer/gamepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context){
        return MaterialApp(
            initialRoute: '/',
            routes: {
                '/': (context) => const Launchpage(),
            },
            onGenerateRoute: (settings){
                if(settings.name == '/game'){
                    return MaterialPageRoute(
                        builder: (context) {
                            return Gamepage();
                        },
                    );
                }
            }
        );
    }
}

