// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
//import 'common/new_beauty_icons.dart';

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
  int _currIndex = 0;
  late NotchBottomBarController _controller;
  late TabController _tabController;
  final _kTabPages = <Widget>[
    const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];


  @override
  void initState() {
    super.initState();
    _controller = NotchBottomBarController(index: _selectedIndex);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _kTabPages[_selectedIndex]),
      bottomNavigationBar: AnimatedNotchBottomBar(
          durationInMilliSeconds: 200,
          showLabel: true,
          notchBottomBarController: _controller,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              _currIndex = _currIndex == 0 ? 1 : 0;
            });
          },
          bottomBarItems: [
            BottomBarItem(
                inActiveItem: const Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.blueGrey,
                ),
                activeItem: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: child.key == ValueKey('icon1')
                        ? Tween<double>(begin: 1, end: 0.5).animate(anim)
                        : Tween<double>(begin: 0.5, end: 1).animate(anim),
                    child: ScaleTransition(scale: anim, child: child),
                  ),
                  child: _currIndex == 0
                      ? const Icon(FontAwesomeIcons.bars,
                          key: ValueKey('icon1'))
                      : const Icon(
                          FontAwesomeIcons.barsStaggered,
                          key: ValueKey('icon2'),
                        ),
                ),
                itemLabel: 'Liste'),
            const BottomBarItem(
              inActiveItem: Icon(
                FontAwesomeIcons.plus,
                color: Colors.blueGrey,
              ),
              activeItem: const Icon(
                FontAwesomeIcons.squarePlus,
                color: const Color.fromARGB(255, 250, 190, 49),
              ),
              itemLabel: 'New',
            ),
            const BottomBarItem(
              inActiveItem: Icon(
                FontAwesomeIcons.message,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                FontAwesomeIcons.solidMessage,
                color: Color.fromARGB(255, 150, 10, 250),
              ),
              itemLabel: 'Notifiche',
            ),
          ]),
    );
  }
}
