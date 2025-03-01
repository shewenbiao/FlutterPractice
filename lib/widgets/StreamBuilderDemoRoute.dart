import 'package:flutter/material.dart';

class StreamBuilderDemoRoute extends StatelessWidget {
  const StreamBuilderDemoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamBuilder Demo')),
      body: Center(
        child: StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('没有 Stream');
              case ConnectionState.waiting:
                return const Text('等待数据');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return const Text('Stream 已关闭');
            }
          },
        ),
      ),
    );
  }
}