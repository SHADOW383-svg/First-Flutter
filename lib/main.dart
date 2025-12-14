import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Globales Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Ampel', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Ampel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final Map<int, (Color, Color, Color)> phases = {
    0: (Colors.red, Colors.grey, Colors.grey), // Rot
    1: (Colors.red, Colors.yellow, Colors.grey), // Rot + Gelb
    2: (Colors.grey, Colors.grey, Colors.green), // Grün
    3: (Colors.grey, Colors.yellow, Colors.grey), // Gelb
  };

  void nextPhase() {
    _currentIndex = (_currentIndex + 1) % phases.length;
    notifyListeners();
  }
}

class _HomePageState extends State<HomePage> {
  late final Ampel ampel1;

  @override
  void initState() {
    super.initState();
    ampel1 = Ampel();
  }

  @override
  void dispose() {
    ampel1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ampel"),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListenableBuilder(
              listenable: ampel1,
              builder: (context, child) {
                final phase = ampel1.phases[ampel1.currentIndex]!;

                return Column(
                  children: [_lamp(phase.$1), _lamp(phase.$2), _lamp(phase.$3)],
                );
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: ampel1.nextPhase,
              child: const Text("Nächste Phase"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lamp(Color color) {
    return Container(
      width: 120,
      height: 120,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
