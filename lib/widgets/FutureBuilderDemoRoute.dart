import 'package:flutter/material.dart';

class FutureBuilderDemoRoute extends StatelessWidget {
  const FutureBuilderDemoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder 示例'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _fetchData(), // 异步获取数据
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 显示加载指示器
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // 显示错误信息
              return Text('错误: ${snapshot.error}');
            } else {
              // 显示获取到的数据
              return Text('获取到的数据: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }

  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2)); // 模拟网络延迟
    return '这是从网络获取的数据'; // 返回数据
  }
}