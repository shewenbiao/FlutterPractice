import 'package:flutter/material.dart';

class CustomScrollViewRoute extends StatelessWidget {
  const CustomScrollViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    var listView = SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomScrollView"),
      ),
      body: CustomScrollView(
        slivers: [
          listView,
          listView
        ],
      ),
    );
  }
}