import 'package:english_words/english_words.dart';
import 'package:first_flutter_app/widgets/ClipTestRoute.dart';
import 'package:first_flutter_app/widgets/FittedBoxTestRoute.dart';
import 'package:first_flutter_app/widgets/FlexLayoutTestWidget.dart';
import 'package:first_flutter_app/widgets/FormTestRoute.dart';
import 'package:first_flutter_app/widgets/ImageTestRoute.dart';
import 'package:first_flutter_app/widgets/LayoutBuilderTestRoute.dart';
import 'package:first_flutter_app/widgets/ListViewTestRoute.dart';
import 'package:first_flutter_app/widgets/MyNewRoute.dart';
import 'package:first_flutter_app/widgets/ScaffoldRoute.dart';
import 'package:first_flutter_app/widgets/StackTestRoute.dart';
import 'package:first_flutter_app/widgets/WrapLayoutTestWidget.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/widgets/DemoCard.dart';
import 'package:first_flutter_app/widgets/ProgressIndicatorTestRoute.dart';
import 'package:first_flutter_app/widgets/ButtonTestRoute.dart';
import 'package:first_flutter_app/widgets/ShadowTestRoute.dart';
import 'package:first_flutter_app/widgets/AnimationDemoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter 组件演示'),
        routes: {
          'new_page': (context) => const MyNewRoute(),
          'form_page': (context) => const FormTestRoute(),
          'image_page': (context) => const ImageTestRoute(),
          'stack_page': (context) => const StackTestRoute(),
          'layoutBuilder_page': (context) => const LayoutBuilderTestRoute(),
          'clip_test_page': (context) => const ClipTestRoute(),
          'fittedBox_test_page': (context) => const FittedBoxTestRoute(),
          'scaffolded_route_page': (context) => const ScaffoldRoute(),
          'listview_route_page': (context) => const ListViewTestRoute(),
          'flex_layout_page': (context) => const FlexLayoutTestRoute(),
          'wrap_layout_page': (context) => const WrapLayoutTestRoute(),
          'progress_indicator_page': (context) => const ProgressIndicatorTestRoute(),
          'button_test_page': (context) => const ButtonTestRoute(),
          'shadow_test_page': (context) => const ShadowTestRoute(),
          'animation_demo_page': (context) => const AnimationDemoPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSectionTitle('动画示例'),
                const DemoCard(
                  title: '动画示例',
                  description: '演示简单的动画效果',
                  routeName: 'animation_demo_page',
                  icon: Icons.animation,
                ),
                _buildSectionTitle('布局演示'),
                const DemoCard(
                  title: '弹性布局',
                  description: '演示 Flex 布局的使用方式',
                  routeName: 'flex_layout_page',
                  icon: Icons.view_column,
                ),
                const DemoCard(
                  title: '流式布局',
                  description: '演示 Wrap 和 Flow 布局',
                  routeName: 'wrap_layout_page',
                  icon: Icons.wrap_text,
                ),
                const DemoCard(
                  title: '层叠布局',
                  description: '演示 Stack 和 Positioned 组件的使用',
                  routeName: 'stack_page',
                  icon: Icons.layers,
                ),
                
                _buildSectionTitle('基础组件'),
                const DemoCard(
                  title: '表单组件',
                  description: '演示文本框、单选框、复选框等表单组件',
                  routeName: 'form_page',
                  icon: Icons.input,
                ),
                const DemoCard(
                  title: '图片组件',
                  description: '演示图片加载和处理',
                  routeName: 'image_page',
                  icon: Icons.image,
                ),
                const DemoCard(
                  title: '进度指示器',
                  description: '演示 LinearProgressIndicator 和 CircularProgressIndicator 的使用',
                  routeName: 'progress_indicator_page',
                  icon: Icons.refresh,
                ),
                const DemoCard(
                  title: '按钮组件',
                  description: '演示各种按钮组件的使用和自定义',
                  routeName: 'button_test_page',
                  icon: Icons.smart_button,
                ),
                
                _buildSectionTitle('高级组件'),
                const DemoCard(
                  title: '布局构建器',
                  description: '演示 LayoutBuilder 的使用',
                  routeName: 'layoutBuilder_page',
                  icon: Icons.build,
                ),
                const DemoCard(
                  title: '列表视图',
                  description: '演示 ListView 的各种用法',
                  routeName: 'listview_route_page',
                  icon: Icons.list,
                ),
                const DemoCard(
                  title: '裁剪组件',
                  description: '演示各种裁剪组件的使用',
                  routeName: 'clip_test_page',
                  icon: Icons.crop,
                ),
                const DemoCard(
                  title: '阴影效果',
                  description: '演示卡片阴影、装饰盒阴影和文字阴影',
                  routeName: 'shadow_test_page',
                  icon: Icons.layers,
                ),
                const DemoCard(
                  title: 'Scaffold 示例',
                  description: '演示 Scaffold、抽屉菜单、底部导航栏等的使用',
                  routeName: 'scaffolded_route_page',
                  icon: Icons.web_asset,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

class GradientButtonWidget extends StatelessWidget {
  const GradientButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.orange[400]!])),
        child: const Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 40.0, vertical: 18.0),
            child: Text('Gradient Text')));
  }
}

class RandomWords extends StatelessWidget {
  const RandomWords({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Padding(
        padding: const EdgeInsets.all(8.0), child: Text(wordPair.toString()));
  }
}

class IconFontWidget extends StatelessWidget {
  final icons = "\uE03e \uE237 \uE287";

  const IconFontWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.accessible, color: Colors.green),
        Icon(Icons.error, color: Colors.green),
        Icon(Icons.fingerprint, color: Colors.green),
      ],
    );
    // return Text(
    //   icons,
    //   style: const TextStyle(
    //     fontFamily: "MaterialIcons",
    //     fontSize: 24.0,
    //     color: Colors.green,
    //   ),
    // );
  }
}
