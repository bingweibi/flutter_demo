import 'package:flutter/material.dart';
import 'package:extended_tabs/extended_tabs.dart';

class TabDemo extends StatefulWidget {
  @override
  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extended Tabs Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ExtendedTabs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;
  TabController tabController1;
  TabController tabController2;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController1 = TabController(length: 3, vsync: this)
    ..addListener((){
      if(tabController1.index.toDouble() == tabController1.animation.value){
        switch (tabController1.index) {
          case 0:
            print(1);
            break;
          case 1:
            print(2);
            break;
          case 2:
            print(3);
            break;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TabBar(
            indicator: ColorTabIndicator(Colors.blue),
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Tab0"),
              Tab(text: "Tab1"),
            ],
            controller: tabController,
          ),
          Expanded(
            child: ExtendedTabBarView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TabBar(
                      indicator: ColorTabIndicator(Colors.red),
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: "Tab00"),
                        Tab(text: "Tab01"),
                        Tab(text: "Tab02"),
                      ],
                      controller: tabController1,
                    ),
                    Expanded(
                      child: ExtendedTabBarView(
                        children: <Widget>[
                          ToList("Tab00"),
                          ToList("Tab01"),
                          ToList("Tab02"),
                        ],
                        controller: tabController1,
                      ),
                    )
                  ],
                ),
                ToList("Tab1")
              ],
              controller: tabController,
            ),
          )
        ],
      ),
    );
  }
}

class ToList extends StatelessWidget {
  final String tabKey;
  ToList(this.tabKey);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (c, i) {
          return Container(
            //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
            alignment: Alignment.center,
            height: 60.0,
            child: Text("$tabKey : List$i"),
          );
        },
        itemCount: 100);
  }
}
