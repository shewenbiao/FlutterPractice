import 'package:flutter/material.dart';

class ShadowTestRoute extends StatelessWidget {
  const ShadowTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('阴影效果示例'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('卡片阴影：'),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                width: double.infinity,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '这是一个带阴影的卡片',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              
              const Text('装饰盒阴影：'),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Text('使用 BoxDecoration 添加的阴影'),
              ),
              const SizedBox(height: 32.0),
              
              const Text('带渐变的阴影效果：'),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.shade900],
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      offset: const Offset(0, 4),
                      blurRadius: 10.0,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  '渐变背景带阴影',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              
              const Text('文字阴影：'),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: const Text(
                  '带阴影的文字效果',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0,
                      ),
                    ],
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