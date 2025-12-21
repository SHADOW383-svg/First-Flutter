//First-API-Projects
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Globales WIdget -> beschreibt festgelegte Parameter der App im ganzen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deine App', //Name der App für das Gerät
      theme: ThemeData(
        primarySwatch: Colors.green,
      ), //Gloable/Standart Farbe der App
      home:
          const MyHomePage(), //Welche Seite/Widget beim starten der App gezeigt wird
    );
  }
}
