import 'package:flutter/material.dart';

class ButtonTestRoute extends StatelessWidget {
  const ButtonTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('按钮示例'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('基础按钮：'),
              Wrap(
                spacing: 8.0,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ElevatedButton'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('TextButton'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('OutlinedButton'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              
              const Text('带图标的按钮：'),
              Wrap(
                spacing: 8.0,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    label: const Text('发送'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.info),
                    label: const Text('详情'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    label: const Text('删除'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              
              const Text('自定义样式按钮：'),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange.shade400],
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '渐变色按钮',
                      style: TextStyle(color: Colors.white),
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
} 