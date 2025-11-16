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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Liste mit Farben, die durchgewechselt werden sollen
  final List<Color> circleColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  int currentIndex = 1; // Startfarbe

  void changeColor() {
    setState(() {
      currentIndex = (currentIndex + 1) % circleColors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello User!"),
        backgroundColor: const Color.fromARGB(250, 3, 210, 100),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: changeColor,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(35),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: circleColors[currentIndex],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow.withValues(),
                      blurRadius: 1,
                      spreadRadius: 2,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Tippe mich!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),

          Container(
            //color: Color.fromARGB(248, 13, 184, 24),
            width: 300,
            height: 200,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(249, 18, 154, 154),
                  Colors.green,
                  Colors.yellow,
                ],
              ),
            ),
            //decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: Center(
              child: Text(
                "Das ist der Zwilling eines Containers!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(250, 0, 0, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
