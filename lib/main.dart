import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String nomeBottone = 'Click';
  int indiceCorrente = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: const Text('Ciaooo'),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                nomeBottone = 'eheh';
              });
            },
            child: Text(nomeBottone),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ],
          currentIndex: indiceCorrente,
          onTap: (int index) {
            setState(
              () {
                indiceCorrente = index;
              },
            );
          },
        ),
      ),
    );
  }
}
