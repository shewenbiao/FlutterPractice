import 'package:flutter/material.dart';

class TabViewRoute2 extends StatelessWidget {

  const TabViewRoute2({super.key});

  static const tabs = ['Tab 1', 'Tab 2', 'Tab 3'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabView 示例'),
          bottom: TabBar(
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs
              .map((e) => Center(
                      child: Text(
                    e,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
