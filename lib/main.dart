import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

void main() => runApp(const ComicaniApp()); //run the app

class ComicaniApp extends StatelessWidget {
  //create the app as extension of the statelessWidget; closed at line 39
  const ComicaniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComicaniApp',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 74, 223, 37),
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
  late TabController _tabController;

  final _kTabPages = <Widget>[
    const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
  ];

  final _coloris = <Color>[
    const Color.fromARGB(255, 16, 236, 0),
    const Color.fromARGB(255, 253, 190, 89),
  ];

  int? get index => null;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _kTabPages[_selectedIndex]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 136, 0, 255),
        child: const Icon(FontAwesomeIcons.squarePlus),
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index!;
          });
        },
        fabLocation: BubbleBottomBarFabLocation.end,
        elevation: 0,
        hasNotch: false,
        hasInk: false,
        inkColor: Colors.black12,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: _coloris[_selectedIndex],
              icon: const Icon(
                FontAwesomeIcons.bars,
                color: Colors.black,
              ),
              activeIcon: const Icon(
                FontAwesomeIcons.barsStaggered,
                color: Color.fromARGB(255, 12, 180, 0),
              ),
              title: const Text("Liste"),),
          BubbleBottomBarItem(
            backgroundColor: _coloris[_selectedIndex],
            icon: const Icon(
              FontAwesomeIcons.message,
              color: Colors.black,
            ),
            activeIcon: const Icon(
              FontAwesomeIcons.solidMessage,
              color: Color.fromARGB(255, 244, 166, 41),
            ),
            title: const Text("Notifiche"),
          ),
        ],
      ),
    );
  }
}
