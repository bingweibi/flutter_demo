import 'package:flutter/material.dart';

import 'CustomPageView.dart';
import 'ecpDemoBean.dart';

class EcpMyDemo extends StatefulWidget {
  @override
  _EcpMyDemoState createState() => _EcpMyDemoState();
}

class _EcpMyDemoState extends State<EcpMyDemo> {

  PageController _controller;
  int _currentIndex = 1;
  List<EcpDemoBean> ecpDemoBeanList;
  List<int> ecpDemoBeanList2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ecpDemoBeanList = [
      EcpDemoBean("周芷若的2020-12-19请假审批","2020-02-19 02:29:35", "张无忌4", "23时35分"),
      EcpDemoBean("周芷若的2020-12-19请假审批","2020-02-19 02:29:35", "张无忌1", "23时35分"),
      EcpDemoBean("周芷若的2020-12-19请假审批","2020-02-19 02:29:35", "张无忌2", "23时35分"),
      EcpDemoBean("周芷若的2020-12-19请假审批","2020-02-19 02:29:35", "张无忌3", "23时35分"),
      EcpDemoBean("周芷若的2020-12-19请假审批","2020-02-19 02:29:35", "张无忌4", "23时35分"),
      EcpDemoBean("周芷若的2020-12-19请假审批","2020-02-19 02:29:35", "张无忌1", "23时35分"),
    ];
    ecpDemoBeanList2 = [
      1,2,3,4
    ];
    _controller = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        height: 300,
        child: Column(
          children: <Widget>[
            Container(
              height: 45,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "我发起的",
                    style: TextStyle(fontSize: 16, color: Colors.black,decoration: TextDecoration.none),
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),
            ),
            Container(
              height: 230,
              color: Colors.transparent,
              child: CustomPageView.builder(
                  itemCount: ecpDemoBeanList.length,
                  controller: _controller,
                  onPageChanged: (index){
                    int nextIndex;
                    if(index == ecpDemoBeanList.length-1){
                      nextIndex = 1;
                      _controller.jumpToPage(nextIndex);
                    }else if (index == 0){
                      nextIndex = ecpDemoBeanList.length-2;
                      _controller.jumpToPage(nextIndex);
                    }else{
                      nextIndex = index;
                    }
                    setState(() {
                      _currentIndex = nextIndex;
                    });
                  },
                  itemBuilder: (context, index) {
                    return new Center(
                      child: _returnEcpMycContent(ecpDemoBeanList[index]),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: ecpDemoBeanList2
                  .asMap()
                  .map((i, v) => MapEntry(
                  i,
                  Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.only(left: 2.0, right: 2.0),
                    decoration: ShapeDecoration(
                        color: _currentIndex == i + 1
                            ? Colors.red
                            : Colors.grey,
                        shape: CircleBorder()),
                  )))
                  .values
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  _returnEcpMycContent(EcpDemoBean ecpDemoBean) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8.0,right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width:180,
                  child: Text(
                    ecpDemoBean.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14,color: Colors.black,decoration: TextDecoration.none),
                  ),
                ),
                Text(
                  "123",
                  style: TextStyle(fontSize: 14,color: Colors.black,decoration: TextDecoration.none),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 150,
              child: Image.asset('images/timg.jpg')
          ),
          Text(
            "待${ecpDemoBean.name}审批",
            style: TextStyle(fontSize: 16,color:Colors.black,decoration: TextDecoration.none),
          ),
          Text(
            "用时${ecpDemoBean.totalTime}",
            style: TextStyle(fontSize: 14,color:Colors.black,decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
