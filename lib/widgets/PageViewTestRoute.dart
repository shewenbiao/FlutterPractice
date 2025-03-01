import 'package:flutter/material.dart';

class PageViewTestRoute extends StatelessWidget {
  const PageViewTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView 示例'),
      ),
      body: PageView(
        // 设置页面滑动效果
        physics: const BouncingScrollPhysics(),
        children: [
          _buildPage(Colors.red, '页面 1', '这是第一个页面的描述'),
          _buildPage(Colors.green, '页面 2', '这是第二个页面的描述'),
          _buildPage(Colors.blue, '页面 3', '这是第三个页面的描述'),
        ],
      ),
    );
  }

  Widget _buildPage(Color color, String title, String description) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
} 