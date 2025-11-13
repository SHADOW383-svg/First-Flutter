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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello User!"),
        backgroundColor: Color.fromARGB(250, 3, 210, 100),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              //color: Color.fromARGB(250, 255, 21, 0),
              width: 200,
              height: 200,
              padding: EdgeInsetsGeometry.all(35),
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                //color: Colors.blue
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withValues(),
                    blurRadius: 0.1,
                    spreadRadius: 2,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Das ist ein Container!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(250, 0, 0, 0),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(248, 13, 184, 24),
            width: 300,
            height: 200,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            //decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: Center(
              child: Text(
                "Das ist der Zwilling eines Containers!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(250, 0, 0, 0),
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
