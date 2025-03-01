import 'package:first_flutter_app/widgets/ChatScreen.dart';
import 'package:first_flutter_app/widgets/CustomScrollViewRoute.dart';
import 'package:first_flutter_app/widgets/DialogDemoRoute.dart';
import 'package:first_flutter_app/widgets/InfiniteGridViewRoute.dart';
import 'package:first_flutter_app/widgets/NestedTabBarViewRoute.dart';
import 'package:first_flutter_app/widgets/PageViewTestRoute.dart';
import 'package:first_flutter_app/widgets/StreamBuilderDemoRoute.dart';
import 'package:first_flutter_app/widgets/WillPopScopeTestRoute.dart';
import 'package:flutter/material.dart';

import 'CustomScrollViewRoute2.dart';
import 'FutureBuilderDemoRoute.dart';
import 'InheritedWidgetTestRoute.dart';
import 'ListViewTestRoute.dart';
import 'NestedScrollViewRoute.dart';
import 'TabViewRoute2.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(child: FlutterLogo(size: 100.0)),
                  ),
                  Text(
                    "Flutter",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  )
                ],
              ),
            ),
            const Divider(), // 添加分隔线
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildDrawerItem(
                    context,
                    icon: Icons.list,
                    title: 'ListView 示例',
                    routeName: 'listview_route_page',
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.grid_view,
                    title: 'GridView 无限滚动示例',
                    routeName: "gridview_route_page",
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.view_carousel,
                    title: 'PageView 示例',
                    routeName: "pageview_route_page",
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.tab,
                    title: 'TabBarView 示例',
                    routeName: 'tabview_route_page',
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.upcoming,
                    title: '自定义滚动视图示例',
                    routeName: 'custom_scroll_view_route',
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.scanner,
                    title: '自定义滚动视图示例 2',
                    routeName: 'custom_scroll_view_route2',
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.favorite,
                    title: 'NestedScrollView 示例',
                    routeName: 'nested_scroll_view_route',
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.nature,
                    title: 'NestedTabBarView 示例',
                    routeName: 'nested_tab_bar_view_route',
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.exit_to_app,
                    title: 'WillPopScope 退出页面示例',
                    routeName: 'will_pop_scope_route',
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.bed,
                    title: 'Dialog 示例',
                    routeName: 'dialog_route_page',
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('Inherited Widget 示例'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const InheritedWidgetTestRoute()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('FutureBuilder 示例'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FutureBuilderDemoRoute()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.stream),
                    title: const Text('StreamBuilder 示例'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const StreamBuilderDemoRoute()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.chat),
                    title: const Text('聊天示例'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String routeName}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  switch (routeName) {
                    case 'listview_route_page':
                      return const ListViewTestRoute();
                    case "gridview_route_page":
                      return const InfiniteGridViewRoute();
                    case "pageview_route_page":
                      return const PageViewTestRoute();
                    case 'tabview_route_page':
                      return const TabViewRoute2();
                    case 'custom_scroll_view_route':
                      return const CustomScrollViewRoute();
                    case 'custom_scroll_view_route2':
                      return const CustomScrollViewRoute2();
                    case 'nested_scroll_view_route':
                      return const NestedScrollViewRoute();
                    case 'nested_tab_bar_view_route':
                      return const NestedTabBarViewRoute();
                    case 'will_pop_scope_route':
                      return const WillPopScopeTestRoute();
                    case 'dialog_route_page':
                      return const DialogDemoRoute();
                    default:
                      return const SizedBox(); // 默认返回空
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
