import 'package:flutter/material.dart';
import 'pages/music_page.dart';
import 'pages/comics_page.dart';
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

  final List<Widget> _pagine = [
    const ComicPage(),
    const MusicPage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const FloatingActionButton(onPressed: null),
        body: PageView(
          controller: _tabController,
          children: _pagine,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _tabController.animateToPage(_selectedIndex, duration: const Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bars),
                label: "gigi",
                activeIcon: Icon(FontAwesomeIcons.barsStaggered)),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.swatchbook),
                label: "piru",
                activeIcon: Icon(FontAwesomeIcons.accusoft)),
          ],
        ));
  }
}
