import 'package:gitpod_flutter_quickstart/src/models/bottom_bar_item_model.dart';
import 'package:gitpod_flutter_quickstart/src/notch_bottom_bar_controller.dart';
import 'package:gitpod_flutter_quickstart/common/notch_bottom_bar.dart';

import 'common/notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(ComicaniApp()); //run the app

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
      home: MyHomePage(),
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

class _MyHomePageState extends State<
        MyHomePage> //MAIN ATTRACTION: here we define the widgets; ends at the end of main.dart
    with
        TickerProviderStateMixin {
  int _selectedIndex = 0;

  /*static final List<Widget> _widgetOptions = <Widget>[
    const Text('xd'),
    const Text('xp'),
  ];*/
  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
  ];

  @override
  void initState() {
    super.initState();
    _notchBottomBarController = NotchBottomBarController(
      index: _selectedIndex,
    );
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _notchBottomBarController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  late NotchBottomBarController _notchBottomBarController;
  late TabController _tabController;

  @override
  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const Color(0XFF1752FE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _notchBottomBarController,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 2',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        showLabel: false,
      ),
    );
  }
}
