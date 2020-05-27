import 'package:flutter/material.dart';

class ReOrderListViewDemo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<ReOrderListViewDemo> {
  List<int> list = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ReorderableListView(
            children: list.map(f).toList(),
            header: Text('This is the header!'),
            onReorder: (oldIndex, newIndex) {
              setState(() {
                _updateMyItems(oldIndex, newIndex);
              });
            }),
      ),
    );
  }

  void _updateMyItems(int oldIndex, int newIndex) {
    var tmp = list[oldIndex];
    list[oldIndex] = list[newIndex];
    list[newIndex] = tmp;
  }

  Widget f(int i) {
    return ListTile(
      key: ValueKey("$i"),
      title: Text('Item $i'),
    );
  }
}