import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_common/common.dart' as commonCharts;

class ChartDemo extends StatefulWidget {
  @override
  _ChartDemoState createState() => _ChartDemoState();
}

class _ChartDemoState extends State<ChartDemo> {
  final List<charts.Series> seriesList1 = _createSampleData1();
  final List<charts.Series> seriesList2 = _createSampleData2();
  final List<charts.Series> seriesList3 = _createSampleData3();

  int touchedIndex;
  var selectItemValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("看板"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
//              Container(
//                height: 406.0,
//                margin: EdgeInsets.fromLTRB(14.0, 16.0, 16.0, 0.0),
//                child: Card(
//                  child: Container(
//                    padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 24.0),
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          height: 38,
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Text(
//                                "业绩指标",
//                                style: TextStyle(
//                                    color: Color(0xff020f22),
//                                    fontSize: 18,
//                                    fontWeight: FontWeight.bold),
//                              ),
//                              Container(
//                                padding: EdgeInsets.only(right: 8),
//                                child: new DropdownButtonHideUnderline(
//                                  child: new DropdownButton(
//                                    elevation: 2,
//                                    isDense: false, //下拉按钮与展示之间的距离
//                                    //设置这个value之后,选中对应位置的item，
//                                    //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
//                                    value: selectItemValue,
//                                    items: generateItemList(),
//                                    onChanged: (T) {
//                                      setState(() {
//                                        selectItemValue = T;
//                                      });
//                                    },
//                                  ),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                        Container(
//                          margin: EdgeInsets.only(top: 17),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: <Widget>[
//                              Text("今年"),
//                              Text("当月"),
//                              Text("本周"),
//                              Text("今日"),
//                            ],
//                          ),
//                        ),
//                        ///饼状图
//                        SizedBox(
//                            height: 235,
//                            child: charts.PieChart(seriesList1,
//                                behaviors: [
//                                  new charts.InitialSelection(
//                                      selectedDataConfig: [
//                                        new charts.SeriesDatumConfig<String>(
//                                            'month', '3')
//                                      ]),
////                                  charts.InitialHintBehavior(maxHintTranslate: 4.0),
////                                  charts.PanAndZoomBehavior(),
//                                ],
//                                animate: true,
//                                animationDuration: Duration(milliseconds: 800),
//                                defaultRenderer: new charts.ArcRendererConfig(
//                                    arcWidth: 50, arcRatio: 0.57))),
//                        Container(
//                          padding: EdgeInsets.only(left: 8.0),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Container(
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      "巴枪录单",
//                                      style: TextStyle(
//                                        color: Color(0xFF020F22),
//                                        fontSize: 18,
//                                        fontWeight: FontWeight.bold,
//                                      ),
//                                    ),
//                                    Text(
//                                      "25,675,669票",
//                                      style: TextStyle(
//                                          color: Color(0xFF020f22),
//                                          fontSize: 16),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              Container(
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      "财务结算",
//                                      style: TextStyle(
//                                          color: Color(0xFF020F22),
//                                          fontSize: 18,
//                                          fontWeight: FontWeight.bold),
//                                    ),
//                                    Text(
//                                      "2,567.56万元",
//                                      style: TextStyle(
//                                          color: Color(0xFF020f22),
//                                          fontSize: 16),
//                                    ),
//                                  ],
//                                ),
//                              )
//                            ],
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                height: 337.0,
//                margin: EdgeInsets.fromLTRB(14.0, 16.0, 16.0, 0.0),
//                child: Card(
//                  child: Container(
//                    padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 24.0),
//                    child: Column(
//                      children: <Widget>[
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Text(
//                              "巴枪件量",
//                              style: TextStyle(
//                                  color: Color(0xff020f22),
//                                  fontSize: 18,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                            GestureDetector(
//                              behavior: HitTestBehavior.opaque,
//                              child: Container(
//                                width: 24.0,
//                                height: 24.0,
//                                child:
//                                    Image(image: AssetImage("images/more.png")),
//                              ),
//                              onTap: () {},
//                            ),
//                          ],
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Container(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    "当月目标",
//                                    style: TextStyle(
//                                        color: Color(0xFF7e8388),
//                                        fontSize: 11,
//                                        fontWeight: FontWeight.normal),
//                                  ),
//                                  Text(
//                                    "20,000,000票",
//                                    style: TextStyle(
//                                        color: Color(0xFF020f22), fontSize: 16),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    "当月实际",
//                                    style: TextStyle(
//                                        color: Color(0xFF7e8388),
//                                        fontSize: 11,
//                                        fontWeight: FontWeight.normal),
//                                  ),
//                                  Text(
//                                    "25,675,669票",
//                                    style: TextStyle(
//                                        color: Color(0xFF020f22), fontSize: 16),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Container(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    "完成率",
//                                    style: TextStyle(
//                                        color: Color(0xFF7e8388),
//                                        fontSize: 11,
//                                        fontWeight: FontWeight.normal),
//                                  ),
//                                  Text(
//                                    "140%",
//                                    style: TextStyle(
//                                        color: Color(0xFF020f22), fontSize: 16),
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//
//                        ///柱状图
//                        SizedBox(
//                            height: 160,
//                            child: charts.BarChart(
//                              seriesList2,
//                              animate: true,
//                              animationDuration: Duration(milliseconds: 800),
//                              barGroupingType: charts.BarGroupingType.grouped,
//                              primaryMeasureAxis: charts.NumericAxisSpec(
//                                  renderSpec: charts.GridlineRendererSpec(
//                                      lineStyle: charts.LineStyleSpec(
//                                dashPattern: [4, 4],
//                                color: charts.Color.fromHex(code: "#e3e6ed"),
//                              ))),
//                            )),
//                        Container(
//                          margin: EdgeInsets.only(top: 16),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Container(
//                                color: Color(0xFF2e8ccd),
//                                child: SizedBox(
//                                  width: 9,
//                                  height: 9,
//                                ),
//                              ),
//                              SizedBox(
//                                width: 6,
//                              ),
//                              Text(
//                                "目标",
//                                style: TextStyle(
//                                    fontSize: 11, color: Color(0xFF020f22)),
//                              ),
//                              SizedBox(
//                                width: 16,
//                              ),
//                              Container(
//                                color: Color(0xff58d8fc),
//                                child: SizedBox(
//                                  width: 9,
//                                  height: 9,
//                                ),
//                              ),
//                              SizedBox(
//                                width: 6,
//                              ),
//                              Text(
//                                "实际完成",
//                                style: TextStyle(
//                                    fontSize: 11, color: Color(0xFF020f22)),
//                              ),
//                              SizedBox(
//                                width: 20,
//                              ),
//                              Text(
//                                "数据统计从2018年12月1日至今",
//                                style: TextStyle(
//                                    color: Color(0xFFA4ABB0), fontSize: 11),
//                              )
//                            ],
//                          ),
//                        ),
//                        Container(
//                          margin: EdgeInsets.only(top: 17),
//                          width: 40,
//                          height: 18,
//                          child: Image(image: AssetImage("images/more.png")),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//              ),
              Container(
                height: 356.0,
                margin: EdgeInsets.fromLTRB(14.0, 16.0, 16.0, 16.0),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 24.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "财政营收趋势",
                              style: TextStyle(
                                  color: Color(0xff020f22),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                child:
                                    Image(image: AssetImage("images/more.png")),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "当月目标",
                                    style: TextStyle(
                                        color: Color(0xFF7e8388),
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "20,000.00万元",
                                    style: TextStyle(
                                        color: Color(0xFF020f22), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "当月实际",
                                    style: TextStyle(
                                        color: Color(0xFF7e8388),
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "2,567.56万元",
                                    style: TextStyle(
                                        color: Color(0xFF020f22), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "完成率",
                                    style: TextStyle(
                                        color: Color(0xFF7e8388),
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "140%",
                                    style: TextStyle(
                                        color: Color(0xFF020f22), fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 8, 0, 34),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "6月营收较上月增长10%，同比增长130%",
                              style: TextStyle(
                                  color: Color(0xFF2e8CCD), fontSize: 12),
                            ),
                          ),
                        ),
                        ///折线图
                        SizedBox(
                          height: 155,
                          child: charts.LineChart(
                            seriesList3,
                            defaultRenderer: charts.LineRendererConfig(
                                includeArea: true,
                                stacked: true,
                                includePoints: true,
                                radiusPx: 3.5),
                            animate: true,
                            animationDuration: Duration(milliseconds: 800),
                            primaryMeasureAxis: charts.NumericAxisSpec(
                              renderSpec: charts.GridlineRendererSpec(
                                lineStyle: charts.LineStyleSpec(
                                  dashPattern: [4,4],
                                  color: charts.Color.fromHex(code:"#e3e6ed"),
                                )
                              )
                            ),
                            domainAxis: new charts.NumericAxisSpec(
//                              desiredTickCount: 2,
                              tickProviderSpec: new charts.StaticNumericTickProviderSpec(<charts.TickSpec<int>>[
                                charts.TickSpec(0),
                                charts.TickSpec(1),
                                charts.TickSpec(2),
                                charts.TickSpec(3),
                                charts.TickSpec(4),
                                charts.TickSpec(5),
                                charts.TickSpec(6),
                                charts.TickSpec(7),
                                charts.TickSpec(8),
                                charts.TickSpec(9),
                                charts.TickSpec(10),
                                charts.TickSpec(11),
                                charts.TickSpec(12),
                              ]),
                              showAxisLine: true,
//                              scaleSpec: commonCharts.FixedPixelOrdinalScaleSpec(
//                                12
//                              ),
                              renderSpec: charts.SmallTickRendererSpec(
                                labelOffsetFromAxisPx: 6,
                                labelStyle: charts.TextStyleSpec(
                                  fontSize: 12,
                                  color: charts.Color.fromHex(code:"#020f22"),
                                ),
                                tickLengthPx: 4,
                                lineStyle: charts.LineStyleSpec(
                                  color:charts.Color.fromHex(code: "#e3e6ed"),
                                ),
                              )

                            ),
                          ),
                        ),
                        Text(
                          "数据统计时间从2018年12月1日至今",
                          style:
                              TextStyle(color: Color(0xFFa4abb0), fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff76DDFB),
            value: 40,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff53A8E2),
            value: 30,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff2c82be),
            value: 15,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xffDBECF8),
            value: 15,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }

  List<DropdownMenuItem> generateItemList() {
    List<DropdownMenuItem> items = new List();
    DropdownMenuItem item1 =
        new DropdownMenuItem(value: '分享看板', child: new Text('分享看板'));
    DropdownMenuItem item2 =
        new DropdownMenuItem(value: '创建群组', child: new Text('创建群组'));
    DropdownMenuItem item3 =
        new DropdownMenuItem(value: '创建会议', child: new Text('创建会议'));
    DropdownMenuItem item4 =
        new DropdownMenuItem(value: '创建任务', child: new Text('创建任务'));
    items.add(item1);
    items.add(item2);
    items.add(item3);
    items.add(item4);
    return items;
  }

  static List<charts.Series> _createSampleData1() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

List<charts.Series<GroupBarChart, String>> _createSampleData2() {
  final desktopSalesData = [
    new GroupBarChart('1月', 5),
    new GroupBarChart('2月', 25),
    new GroupBarChart('3月', 100),
    new GroupBarChart('4月', 75),
  ];

  final tableSalesData = [
    new GroupBarChart('1月', 25),
    new GroupBarChart('2月', 50),
    new GroupBarChart('3月', 10),
    new GroupBarChart('4月', 20),
  ];

  final tableSalesData2 = [
    new GroupBarChart('1月', 25),
    new GroupBarChart('2月', 50),
    new GroupBarChart('3月', 10),
    new GroupBarChart('4月', 20),
  ];
  final tableSalesData3 = [
    new GroupBarChart('1月', 25),
    new GroupBarChart('2月', 50),
    new GroupBarChart('3月', 10),
    new GroupBarChart('4月', 20),
  ];

  return [
    new charts.Series<GroupBarChart, String>(
        id: 'Desktop',
        domainFn: (GroupBarChart sales, _) => sales.month,
        measureFn: (GroupBarChart sales, _) => sales.sales,
        data: desktopSalesData,
        labelAccessorFn: (GroupBarChart sales, _) =>
            '${sales.sales.toString()}'),
    new charts.Series<GroupBarChart, String>(
      id: 'Tablet',
      domainFn: (GroupBarChart sales, _) => sales.month,
      measureFn: (GroupBarChart sales, _) => sales.sales,
      data: tableSalesData,
      labelAccessorFn: (GroupBarChart sales, _) => '${sales.sales.toString()}',
    ),
//    new charts.Series<GroupBarChart, String>(
//      id: 'Tablet2',
//      domainFn: (GroupBarChart sales, _) => sales.month,
//      measureFn: (GroupBarChart sales, _) => sales.sales,
//      data: tableSalesData2,
//      labelAccessorFn: (GroupBarChart sales,_) => '${sales.sales.toString()}',
//    ),
//    new charts.Series<GroupBarChart, String>(
//      id: 'Tablet3',
//      domainFn: (GroupBarChart sales, _) => sales.month,
//      measureFn: (GroupBarChart sales, _) => sales.sales,
//      data: tableSalesData3,
//      labelAccessorFn: (GroupBarChart sales,_) => '${sales.sales.toString()}',
//    ),
//    new charts.Series<GroupBarChart, String>(
//      id: 'Tablet4',
//      domainFn: (GroupBarChart sales, _) => sales.month,
//      measureFn: (GroupBarChart sales, _) => sales.sales,
//      data: tableSalesData3,
//      labelAccessorFn: (GroupBarChart sales,_) => '${sales.sales.toString()}',
//    ),
//    new charts.Series<GroupBarChart, String>(
//      id: 'Tablet5',
//      domainFn: (GroupBarChart sales, _) => sales.month,
//      measureFn: (GroupBarChart sales, _) => sales.sales,
//      data: tableSalesData3,
//      labelAccessorFn: (GroupBarChart sales,_) => '${sales.sales.toString()}',
//    ),
  ];
}

List<charts.Series<LinearSales, int>> _createSampleData3() {
  final myFakeDesktopData = [
    new LinearSales(0, 5),
    new LinearSales(1, 25),
    new LinearSales(2, 100),
    new LinearSales(3, 75),
    new LinearSales(4, 175),
    new LinearSales(5, 175),
    new LinearSales(6, 405),
    new LinearSales(7, 175),
    new LinearSales(8, 105),
    new LinearSales(9, 175),
    new LinearSales(10, 1775),
    new LinearSales(11, 375),
    new LinearSales(12, 575),
  ];

  return [
    new charts.Series<LinearSales, int>(
      id: 'Desktop',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (LinearSales sales, _) => sales.month,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: myFakeDesktopData,
    ),
  ];
}

class LinearSales {
  final int month;
  final int sales;

  LinearSales(this.month, this.sales);
}

class GroupBarChart {
  final String month;
  final int sales;

  GroupBarChart(this.month, this.sales);
}
