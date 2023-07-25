/*import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:circular_menu/circular_menu.dart'; //there are also more features than the one used below
import 'pages/music_page.dart';
import 'pages/comics_page.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'common/bottom_bar_items.dart';

void main() => runApp(const ComicaniApp()); //run the app

class ComicaniApp extends StatelessWidget {
  //create the app as extension of the statelessWidget; closed at line 39
  const ComicaniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComicaniApp',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
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
  late PageController _tabController;

  /*final _kTabPages = <Widget>[
    const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
  ];*/

  final List<Widget> _pagine = [
    const ComicPage(),
    const MusicPage(),
  ];

  final Color buttonColor = Color.fromARGB(163, 143, 143, 143);

  int? get index => null;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircularMenu(
        alignment: Alignment.bottomRight,
        radius: 100,
        animationDuration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
        reverseCurve: Curves.ease,
        toggleButtonColor: buttonColor,
        toggleButtonBoxShadow: const [
          BoxShadow(
            blurRadius: 0,
          ),
        ],
        toggleButtonIconColor: Color.fromARGB(255, 0, 0, 0),
        toggleButtonSize: 40.0,
        items: [
          CircularMenuItem(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 0,
                ),
              ],
              icon: FontAwesomeIcons.fileMedical,
              color: buttonColor,
              iconColor: Colors.white,
              iconSize: 25.0,
              margin: 10.0,
              padding: 10.0,
              onTap: () {
                //TODO: callback
              }),
          CircularMenuItem(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 0,
                ),
              ],
              icon: FontAwesomeIcons.commentMedical,
              color: buttonColor,
              iconColor: Colors.white,
              iconSize: 25.0,
              margin: 10.0,
              padding: 10.0,
              onTap: () {
                //TODO: callback
              }),
        ],
      ),
      body: PageView(
        controller: _tabController,
        children: _pagine,
      ),
      bottomNavigationBar: StylishBottomBar(
        currentIndex: _selectedIndex,
        backgroundColor: Color.fromARGB(202, 63, 63, 63),
        bubbleFillStyle: BubbleFillStyle.outlined,
        barStyle: BubbleBarStyle.horizotnal,
        barAnimation: BarAnimation.blink,
        onTap: (index) {
          setState(() {
            _selectedIndex = index!;
            _tabController.jumpToPage(index);
          });
        },
        items: [
          BubbleBarItem(
            activeIcon: const Icon(FontAwesomeIcons.bookSkull),
            icon: const Icon(FontAwesomeIcons.book),
            title: const Text('Comics'),
            backgroundColor: Color.fromARGB(178, 13, 201, 0),
          ),
          BubbleBarItem(
            activeIcon: const Icon(FontAwesomeIcons.napster),
            icon: const Icon(FontAwesomeIcons.headphones),
            title: const Text('Safety'),
            backgroundColor: Color.fromARGB(165, 255, 181, 61),
          ),
        ],
      ),
    );
  }
}*/