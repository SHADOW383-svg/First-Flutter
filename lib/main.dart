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
          const HomePage(), //Welche Seite/Widget beim starten der App gezeigt wird
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String originalText = "This text has been changed";
  String get toggle => originalText;
  String newText = "this is the original text";

  void changeText() {
    setState(() {
      //Toggle for the replacing text logic
      if (newText == originalText) {
        newText = "this is the original text";
      } else {
        newText = originalText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responding Grid"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: changeText,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: Text(newText),
            ),
          ),
        ],
      ),
    );
  }
}
