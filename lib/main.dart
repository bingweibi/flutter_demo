import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/reorderlistviewdemo.dart';
import 'package:flutter_chart_demo/reorderwrapdemo.dart';
import 'package:flutter_chart_demo/shapeDemo.dart';

import 'badgeDemo.dart';
import 'chartDemo.dart';
import 'ecpMyDemo.dart';
import 'dropDownDemo.dart';
import 'nestedScrollDemo.dart';
import 'nestedScrollDemoPage.dart';
import 'tabDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> title = ["chartDemo","badgeDemo","nestedScrollDemo",
    "NestedScrollDemoPage","tabDemo","ecpMyDemo",'dropDownButtonDemo',"shapeDemo","reorderListViewDemo","ReOrderWrapDemo"
  ];
  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(
      color: Colors.grey,
    );

    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: ListTile(
              title: Text(index <= 9 ? title[index]: "$index"),
            ),
            onTap: () {
              if(index == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ChartDemo();
                }));
              }else if(index == 1){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return BadgeDemo();
                }));
              }else if(index == 2){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return NestedScrollDemo();
                }));
              }else if(index == 3){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return NestedScrollDemoPage();
                }));
              }else if(index == 4){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return TabbedAppBarSample();
                }));
              }else if(index == 5){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return EcpMyDemo();
                }));
              }else if(index == 6){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return DropDownButtonDemo();
                }));
              }else if(index == 7){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return ShapeDemo();
                }));
              }else if(index == 8){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return ReOrderListViewDemo();
                }));
              }else if(index == 9){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return WrapExample();
                }));
              }
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return divider;
        },
      ),
    );
  }
}
