import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Globales Widget -> beschreibt festgelegte Parameter der App im ganzen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'My App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> colorList = List.generate(12, (_) => Colors.teal);

  void toggleTile(int index) {
    setState(() {
      colorList[index] = colorList[index] == Colors.teal
          ? Colors.red
          : Colors.teal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What ever"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: colorList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => toggleTile(index),
            child: Container(
              color: colorList[index],
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text("Hello World"),
            ),
          );
        },
      ),
    );
  }
}
