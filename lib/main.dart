import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(ComicaniApp());

class ComicaniApp extends StatelessWidget {
  const ComicaniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComicaniApp',
      theme: ThemeData(
        primaryColor: Colors.blueAccent[400],
        canvasColor: const Color(0xFFF8F8F8),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    const Text('Liste'),
    const Text('Notifiche'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        fixedColor: Colors.amber,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.rectangleList), label: 'Liste'),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.message),
            label: 'Liste',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
