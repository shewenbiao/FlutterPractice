import 'package:flutter/material.dart';

class WrapLayoutTestRoute extends StatelessWidget {
  const WrapLayoutTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('流式布局示例'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Wrap 流式布局示例：',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.start, //沿主轴方向居中
                children: const <Widget>[
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('A')),
                    label: Text('Hamilton'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('M')),
                    label: Text('Lafayette'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('H')),
                    label: Text('Mulligan'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('J')),
                    label: Text('Laurens'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text('Flow 流式布局示例：',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,  // 减小高度到100
                child: Flow(
                  delegate: MyFlowDelegate(),
                  children: [
                    _buildItem(Colors.red, '1'),
                    _buildItem(Colors.green, '2'),
                    _buildItem(Colors.blue, '3'),
                    _buildItem(Colors.yellow, '4'),
                    _buildItem(Colors.brown, '5'),
                    _buildItem(Colors.purple, '6'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Flow 特点：\n'
                '• 可以自定义布局策略\n'
                '• 性能好，Flow 是一个对子组件尺寸以及位置调整非常高效的控件\n'
                '• 灵活性更大，可以自定义布局策略',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Color color, String text) {
    return Container(
      width: 80,  // 增加宽度到80
      height: 50, // 增加高度到50
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

class MyFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;
    final double width = context.size.width;
    const double space = 8.0; // 增加间距到8
    
    for (int i = 0; i < context.childCount; i++) {
      final size = context.getChildSize(i)!;
      
      if (x + size.width > width) {
        x = 0;
        y += size.height + space;
      }
      
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
      
      x += size.width + space;
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, 120.0); // 增加高度到120以确保能显示所有内容
  }
}