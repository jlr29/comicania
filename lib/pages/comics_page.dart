import 'package:flutter/material.dart';

class ComicPage extends StatefulWidget {
  const ComicPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage>
    with SingleTickerProviderStateMixin {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _getToolbar(context),
        ],
      ),
    );
  }

  Padding _getToolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Image(
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
            image: AssetImage('/workspace/comicania/assets/crab.png')),
      ]),
    );
  }
}
