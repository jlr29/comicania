import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>
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
    return new Padding(
      padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        new Image(
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
            image: new AssetImage('/workspace/comicania/assets/list.png')),
      ]),
    );
  }
}
