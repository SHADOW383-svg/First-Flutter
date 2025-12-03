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

class ChangeValue1 extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increaseValue() {
    _count++;
    notifyListeners();
  }
}

class _HomePageState extends State<HomePage> {
  late ChangeValue1 changeValue0;
  @override
  void initState() {
    super.initState();
    changeValue0 = ChangeValue1();
  }

  @override
  void dispose() {
    changeValue0.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("What ever"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListenableBuilder(
            listenable: changeValue0,
            builder: (context, child) {
              return Text(
                'counter: ${changeValue0.count}',
                style: const TextStyle(fontSize: 22),
              );
            },
          ),
          TextButton(
            onPressed: () {
              changeValue0.increaseValue();
            },
            child: const Text("Does it work?"),
          ),
        ],
      ),
    );
  }
}
