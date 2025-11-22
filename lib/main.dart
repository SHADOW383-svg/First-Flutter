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

class GridItem {
  bool selected;

  GridItem(this.selected);
}

final items = List.generate(20, (_) => GridItem(false));

class GridTileWidget extends StatelessWidget {
  final GridItem item;
  final VoidCallback onToggle;

  const GridTileWidget({super.key, required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        decoration: BoxDecoration(
          color: item.selected ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GridTileWidget(
            item: items[index],
            onToggle: () {
              setState(() {
                items[index].selected = !items[index].selected;
              });
            },
          );
        },
      ),
    );
  }
}
