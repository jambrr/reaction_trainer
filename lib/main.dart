import 'package:flutter/material.dart';
import 'package:reaction_trainer/launchpage.dart';
import 'package:reaction_trainer/gamepage.dart';
import 'package:reaction_trainer/scoreboard.dart';

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
                if(settings.name == '/scoreboard'){
                    final args = settings.arguments as Map<String, int>;
                    
                    return MaterialPageRoute(
                        builder: (context) {
                            return Scoreboardpage(args['circleCounter'], args['time']);
                        },
                    );
                }
            }
        );
    }
}

