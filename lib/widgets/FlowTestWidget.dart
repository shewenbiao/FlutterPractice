import 'package:flutter/material.dart';

class FlowTestWidget extends StatelessWidget {
  const FlowTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TestFlowDelegate(margin: const EdgeInsets.all(10.0)),
      children: <Widget>[
        _buildItem(Colors.red, 'Red'),
        _buildItem(Colors.green, 'Green'),
        _buildItem(Colors.blue, 'Blue'),
        _buildItem(Colors.yellow, 'Yellow'),
        _buildItem(Colors.purple, 'Purple'),
        _buildItem(Colors.orange, 'Orange'),
        _buildItem(Colors.brown, 'Brown'),
        _buildItem(Colors.pink, 'Pink'),
        _buildItem(Colors.indigo, 'Indigo'),
        _buildItem(Colors.cyan, 'Cyan')
      ],
    );
  }

  Widget _buildItem(Color color, String text) {
    return Container(
      width: 80,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6), // 适当增加圆角
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18), // 增加字号
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度尽可能大，但高度指定为400，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 400.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
