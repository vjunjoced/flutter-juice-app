import 'package:flutter/material.dart';
import 'package:juice_pp/src/pages/detail_page.dart';
import 'package:juice_pp/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juice App',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => HomePage(),
        'detail': (BuildContext context) => DetailPage(),
      }
      
    );
  }
}