import 'package:flutter/material.dart';
import 'package:reaction_trainer/launchpage.dart';
import 'package:reaction_trainer/gamepage.dart';
import 'package:reaction_trainer/scoreboard.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    final args = settings.arguments as Map;
                    
                    return MaterialPageRoute(
                        builder: (context) {
                            return Scoreboardpage(args['circleCounter'], args['time'], args['scores']);
                        },
                    );
                }
            },
            theme: ThemeData(
                primaryColor: Colors.lightBlue[800],
                textTheme: GoogleFonts.rubikTextTheme().copyWith(
                    headline1: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w600),
                    headline2: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w500),
                    bodyText2: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400),
                    bodyText1: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500),
                ).apply(
                    displayColor: Color(0xff31274C),
                    bodyColor: Color(0xff31274C),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffB69BFF),
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                        textStyle: GoogleFonts.rubik(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                ),
            ),
        );
    }
}

