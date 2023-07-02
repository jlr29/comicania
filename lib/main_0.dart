import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const ComicaniApp()); //run the app

class ComicaniApp extends StatelessWidget {
  //create the app as extension of the statelessWidget; closed at line 39
  const ComicaniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComicaniApp',
      theme: ThemeData(
        primaryColor: Colors.blueAccent[400],
        canvasColor: const Color(0xFFF8F8F8),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  //creates the home page as extension of statefulWidget; ends at line 46
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  //MAIN ATTRACTION: here we define the widgets; ends at the end of main.dart
  int _selectedIndex = 0;

  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
  ];

  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
    Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late PageController _tabController;

  @override
  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const Color(0XFF1752FE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _tabController,
        children: _kTabPages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _tabController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Text("R"), activeIcon: Text("Active"), label: "Active"),
          BottomNavigationBarItem(
              icon: Text("G"), activeIcon: Text("Active"), label: "Red"),
        ],
      ),
    );
  }
}
