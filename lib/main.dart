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

//Das ist essentiell, wenn man mit StatefulWidgets arbeiten will
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Ampel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Color> farbe = [Colors.red, Colors.yellow, Colors.green];

  void changeColor() {
    _currentIndex = currentIndex + 1;

    if (_currentIndex == farbe.length) {
      _currentIndex = 0;
    }
    notifyListeners();
  }
}

class _HomePageState extends State<HomePage> {
  late Ampel ampel1;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListenableBuilder(
              listenable: ampel1,
              builder: (context, child) {
                return Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ampel1.farbe[ampel1.currentIndex],
                        shape: BoxShape.circle,
                      ),
                    ),

                    Container(
                      width: 120,
                      height: 120,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ampel1.farbe[ampel1.currentIndex],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ampel1.farbe[ampel1.currentIndex],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                );
              },
            ),

            TextButton(
              onPressed: () {
                ampel1.changeColor();
              },
              child: Text("Press here, to change the Color"),
            ),
          ],
        ),
      ),
    );
  }
}
