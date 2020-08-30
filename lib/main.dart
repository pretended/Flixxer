import 'package:flixxer/frontend/helpers/MovieWidget.dart';
import 'package:flixxer/frontend/screens/DiscoverScreen.dart';
import 'package:flixxer/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          primarySwatch: Colors.lightBlue,
        ),
        home: DiscoverScreen()
    );
  }
}