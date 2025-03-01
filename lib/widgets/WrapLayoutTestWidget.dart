import 'package:first_flutter_app/widgets/FlowTestWidget.dart';
import 'package:flutter/material.dart';

class WrapLayoutTestRoute extends StatelessWidget {
  const WrapLayoutTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('流式布局示例'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Wrap 流式布局示例：',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.start, //沿主轴方向居中
                children: <Widget>[
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
              SizedBox(height: 32),
              Text('Flow 流式布局示例：',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              FlowTestWidget(),
              SizedBox(height: 16),
              Text(
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
}
