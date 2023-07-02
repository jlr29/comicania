import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/extension/shadow.dart';
import '../src/bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/build_icon.dart';
import 'package:flutter/material.dart';

class BottomTabbarJolomon extends StatefulWidget {
  final List<TabItem> items;
  final Function(int index)? onTap;
  final List<BoxShadow>? boxShadow;
  final Curve curve;

  final Duration duration;

  final BorderRadius? radiusSalomon;

  final Color colorSelected;
  final double iconSize;
  final TextStyle? titleStyle;
  final int indexSelected;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final Color backgroundSelected;
  final double? blur;
  final CountStyle? countStyle;
  final double? heightItem;
  final Color color;
  final bool animated;
  final double? top;
  final double? bottom;
  final bool? enableShadow;

  const BottomTabbarJolomon({
    Key? key,
    required this.items,
    required this.colorSelected,
    required this.color,
    required this.indexSelected,
    required this.backgroundColor,
    required this.backgroundSelected,
    this.blur,
    this.countStyle,
    this.heightItem = 38,
    this.boxShadow,
    this.onTap,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 200),
    this.radiusSalomon,
    this.iconSize = 22,
    this.titleStyle,
    this.borderRadius,
    this.animated = true,
    this.bottom = 12,
    this.top = 12,
    this.enableShadow = true,
  }) : super(
          key: key,
        );
  @override
  State<BottomTabbarJolomon> createState() => _BottomTabbarJolomonState();
}


class _BottomTabbarJolomonState extends State<BottomTabbarJolomon>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }
  
  late TabController _tabController;

  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
    Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
    Tab(icon: Icon(Icons.forum), text: 'Tab3'),
  ];


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}

