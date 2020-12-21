import 'package:flutter/material.dart';
import 'package:covid19tracker/pages/loading.dart';
import 'package:covid19tracker/pages/homePage.dart';
import 'package:covid19tracker/pages/detailedCountry.dart';
import 'package:covid19tracker/pages/globalStats.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => Loading(),
        '/global': (context) => GlobalStats(),
        '/home': (context) => HomePage(),
        '/details': (context) => DetailedCountry(),
      }
  ));
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.white,
//    );
//  }
//}
