import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

const List<TabItem> items = [
  TabItem(
    icon: FontAwesomeIcons.barsStaggered,
    title: 'Liste',
  ),
  TabItem(
    icon: FontAwesomeIcons.message,
    title: 'Notifiche',
  ),
];

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
  Color colorSelect =const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const  Color(0XFF1752FE);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomBarSalomon(
        items: items,
        color: Colors.blue,
        backgroundColor: Colors.white,
        colorSelected: Colors.white,
        backgroundSelected: Colors.blue,
        borderRadius: BorderRadius.circular(0),
        indexSelected: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }
}
