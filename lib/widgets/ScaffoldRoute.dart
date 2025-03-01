import 'package:first_flutter_app/widgets/MyDrawer.dart';
import 'package:first_flutter_app/widgets/HomePage.dart';
import 'package:first_flutter_app/widgets/ToolsPage.dart';
import 'package:first_flutter_app/widgets/MinePage.dart';
import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0; // 当前选中的底部导航索引

  // 页面列表
  final List<Widget> _pages = const [
    HomePage(), // 首页
    ToolsPage(), // 工具页面
    MinePage(), // 我的页面
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: const Text("App Name"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          // 添加返回按钮
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const MyDrawer(), //抽屉
      body: _pages[_selectedIndex], // 根据选中的索引显示对应的页面
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Tools'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mine'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        //悬浮按钮
          onPressed: _onAdd,
          //悬浮按钮
          child: const Icon(Icons.add)),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}
