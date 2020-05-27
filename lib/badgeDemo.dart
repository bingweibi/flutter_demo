import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeDemo extends StatefulWidget {
  @override
  _BadgeDemoState createState() => _BadgeDemoState();
}

class _BadgeDemoState extends State<BadgeDemo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ThemeColors.colorBlack = Color.fromARGB(255, 0, 0, 0);
    demo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: 86,
          height: 42,
child: FlatButton(
  color: ThemeColors.colorBlack,
  onPressed: (){
    setState(() {
      ThemeColors.colorBlack = Colors.green;
    });

  },
),
//          child: Stack(
////            mainAxisSize: MainAxisSize.min,
////            mainAxisAlignment: MainAxisAlignment.center,
////            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Align(
//                alignment: Alignment.bottomCenter,
//                child: Container(
//                  width: 28,
//                  height: 28,
//                  color: Colors.red,
//                  child: IconButton(
//                    padding: EdgeInsets.all(0),
//                    icon: Icon(Icons.add),
//                    onPressed: () {},
//                  ),
//                ),
//              ),
//              Align(
//                alignment: FractionalOffset.topRight,
//                child: Container(
//                  width: 30,
//                  height: 18,
//                  alignment: Alignment.center,
//                  decoration: BoxDecoration(
//                    color: Colors.red,
//                    borderRadius: BorderRadius.all(
//                      Radius.circular(9.0),
//                    ),
//                  ),
//                  child: Text(
//                    "99+",
//                    style: TextStyle(fontSize: 10,color: Colors.white),
//                  ),
//                ),
//              )
//            ],
//          ),
        ),
      ),
    );
  }

  demo(){
    String demo = "123|34";
    List<String> tr = demo.split("|");
    print(tr[0] is String);
    print("qqq   "+tr[0]);
    print("qqq   "+tr[1]);
  }
}


class ThemeColors {
  ///纯黑色
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);
}

