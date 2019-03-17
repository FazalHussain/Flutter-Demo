import 'package:flutter/material.dart';
import './screens/Home.dart';

/// [main] Entry point of a Flutter App
/// [runApp] inflate the widget and attached it to screen
/// [Center] and [Text] are the widgets
/// remember when you use the [Text] specify the [TextDirection]
/// new keyword is optional in Flutter
void main() => runApp(HelloWorldApp());

///Stateless widget is a widget which is never changed
class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false, //disapear debug tag
      title: "Hello Flutter App",
      home: Scaffold(
        appBar: AppBar(
            title: Text("Hello Flutter App")
        ),
        body: Home(),
      ),
    );
  }

}
