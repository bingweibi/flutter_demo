import 'package:flutter/material.dart';

class NestedScrollDemo extends StatefulWidget {
  @override
  _NestedScrollDemoState createState() => _NestedScrollDemoState();
}

class _NestedScrollDemoState extends State<NestedScrollDemo>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController, _subOneController;
  List<String> tabs = ['1', '2', '3', '4'];
  List<String> subTabs = ['1-1', '1-2', '1-3'];
  int length;
  PageController _pageController, _subPageController;
  ScrollPhysics _outPhysics, _physics;
  bool temp;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _subOneController = TabController(length: 3, vsync: this);
    _pageController = PageController();
    _subPageController = PageController();
    length = _subOneController.length - 2;
    _outPhysics =
        const PageScrollPhysics().applyTo(const ClampingScrollPhysics());
    _physics = const PageScrollPhysics().applyTo(const ClampingScrollPhysics());
    temp = true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("嵌套滑动"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: Center(
        child: NotificationListener<OverscrollNotification>(
          child: PageView(
            physics: _outPhysics,
            controller: _pageController,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TabBar(
                    labelColor: Colors.black,
                    controller: _subOneController,
                    tabs: subTabs
                        .map((e) => Tab(
                              text: e,
                            ))
                        .toList(),
                  ),
                  Expanded(
                      child: NotificationListener<OverscrollNotification>(
                    child: PageView(
                      physics: _physics,
                      controller: _subPageController,
                      children: subTabs
                          .map((e) => Tab(
                                text: e,
                              ))
                          .toList(),
                      onPageChanged: (index) {
                        _subOneController.animateTo(index);
//                                print("内层index  ${index}");
                        if (index == _subOneController.length - 1) {
                          setState(() {
                            _physics = const PageScrollPhysics()
                                .applyTo(const NeverScrollableScrollPhysics());
                          });
                        } else {
                          setState(() {
                            _physics = const PageScrollPhysics()
                                .applyTo(const ClampingScrollPhysics());
                          });
                        }
                      },
                    ),
//                      onNotification: (OverscrollNotification notification) {
//                        setState(() {
//                            _physics = const PageScrollPhysics().applyTo(const NeverScrollableScrollPhysics());
////                            temp = false;
////                            print("physic2   ${temp}");
//                            print("physics2   ${notification.overscroll}");
//                        });
//                        return true;
//                      },
                  )),
                ],
              ),
              ToList("2"),
              ToList("3"),
              ToList("4"),
            ],
            onPageChanged: (index) {
              _tabController.animateTo(index);
              print("外层index   ${index}");
            },
          ),
//          onNotification: (OverscrollNotification notification){
//              setState(() {
//                _physics = const PageScrollPhysics().applyTo(const ClampingScrollPhysics());
////                temp = true;
////                print("physic1   ${temp}");
//                print("physics1   ${notification.overscroll}");
//              });
//            return false;
//          },
        ),
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
