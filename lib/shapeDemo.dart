

import 'package:flutter/material.dart';

class ShapeDemo extends StatefulWidget {
  @override
  _ShapeDemoState createState() => _ShapeDemoState();
}

class _ShapeDemoState extends State<ShapeDemo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: _getRichTextView(),
//          width: 200,
//          height: 200,
//          child: Material(
//            shape: SimpleShape(),
//            color: Colors.green,
//            elevation: 10,
//            child: Container(
//              alignment: Alignment.center,
//              padding: EdgeInsets.all(10),
//              height: 80,
//              child: Text("no shape",style: TextStyle(color: Colors.white,fontSize: 20),),
//            ),
//          ),
            ),
//            Text("askjdbfjhadfggbadgh"),
          ],
        ),
      ),
    );
  }

  _getRichTextView() {
    /// 文本
    String text = "萨达所大所器奥术奥术S奥术的说法会计师读后感说不定就会嘎巴拉SSSSSSSS.doc";
    /// 后缀
    String suffix = "doc";

    TextStyle textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xff020F22),
    );

    return LayoutBuilder(builder: (context, size) {
      /// 原文本Span
      TextSpan fullSpan = TextSpan(text: text, style: textStyle);
      TextPainter fullTp = TextPainter(
        text: fullSpan,
        maxLines: 1,
        textDirection: TextDirection.ltr,);
      fullTp.layout(maxWidth: size.maxWidth,);

      /// 判断是否超过一行
      if (fullTp.didExceedMaxLines) {
        /// 获取截取长度
        int cutLength = suffix.length + 4;
        /// 获取后缀显示文本
        String endText = text.substring(text.length - cutLength);

        /// 计算后缀的宽度
        TextSpan endTs = TextSpan(
          text: endText,
          style: textStyle,
        );
        TextPainter endTp = TextPainter(
          text: endTs,
          textDirection: TextDirection.ltr,
        );
        endTp.layout(maxWidth: size.maxWidth);

        print("附件列表：${fullTp.height}、${endTp.height}");

        return Container(
          width: double.infinity,
//          height: fullTp.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                width: fullTp.width - endTp.width,
                height: fullTp.height,
                child: Text(
                  text,
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
//                alignment: Alignment.bottomCenter,
//                height: fullTp.height,
//              padding: EdgeInsets.only(top: 4),
                child:Text(
                    'jg'+endText.substring(2),
                  style: textStyle,
                  textAlign: TextAlign.justify,
                )
                ,
              )
            ],
          ),
        );
      } else {
        return Text(
          text,
          style: textStyle,
        );
      }
    });
  }
}

class SimpleShape extends ShapeBorder{
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {

    var path = Path();
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)));


    var width = rect.width;
    var height = rect.height;
    var radius = 0.2* height;//直径
    var leftPadding = 0.1* height;
    var topPadding = 0.1* height;
    var left = width - radius - leftPadding;
    var top = topPadding;
    var right = left + radius;
    var bottom = top + radius;
//    path.addRect(Rect.fromLTRB(left+1, top+1, right+1, bottom+1));
    path.addOval(Rect.fromLTRB(left, top, right, bottom));
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    print(rect.toString());
    var paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;
    var width = rect.width;
    var height = rect.height;
    canvas.drawCircle(Offset(0.3*height,0.23*height), 0.082*height, paint);
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    return null;
  }

}
