import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Globales Widget -> beschreibt festgelegte Parameter der App im ganzen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Deine App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Name konsistent: tileColors
  List<Color> tileColors = List.generate(6, (_) => Colors.teal);

  void toggle(int index) {
    setState(() {
      tileColors[index] = tileColors[index] == Colors.teal
          ? Colors.red
          : Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responding Grid"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        // gridDelegate ist zwingend bei GridView.builder
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Anzahl Spalten
          crossAxisSpacing: 10, // Abstand horizontal
          mainAxisSpacing: 10, // Abstand vertikal
          // optional: childAspectRatio: 1, // Seitenverhältnis der Zellen
        ),
        itemCount: tileColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => toggle(index),
            child: Container(
              color: tileColors[index],
              child: Center(
                child: Text(
                  "Kachel $index",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
