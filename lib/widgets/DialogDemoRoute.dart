import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogDemoRoute extends StatelessWidget {
  const DialogDemoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildButton(
              '对话框1: AlertDialog',
              () async {
                bool? result = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('提示'),
                        content: const Text('您确定要删除当前文件吗?'),
                        actions: [
                          TextButton(
                            child: const Text('取消'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('删除'),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          )
                        ],
                      );
                    });
                if (result == true) {
                  debugPrint('删除文件');
                } else {
                  debugPrint('取消删除');
                }
              },
            ),
            const SizedBox(height: 12),
            _buildButton(
              '对话框2: SimpleDialog',
              () async {
                String? result = await showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: const Text('请选择操作'),
                        children: [
                          SimpleDialogOption(
                            child: const Text('复制'),
                            onPressed: () {
                              Navigator.of(context).pop('复制');
                            },
                          ),
                          SimpleDialogOption(
                            child: const Text('移动'),
                            onPressed: () {
                              Navigator.of(context).pop('移动');
                            },
                          ),
                          SimpleDialogOption(
                            child: const Text('删除'),
                            onPressed: () {
                              Navigator.of(context).pop('删除');
                            },
                          ),
                        ],
                      );
                    });
                debugPrint('选择了：$result');
              },
            ),
            const SizedBox(height: 12),
            _buildButton(
              '对话框3: Dialog',
              () async {
                String? result = await showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          children: [
                            const ListTile(title: Text("请选择")),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 30,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text('Item $index'),
                                    onTap: () {
                                      Navigator.of(context).pop('Item $index');
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    });
                debugPrint('选择了：$result');
              },
            ),
            const SizedBox(height: 12),
            _buildButton(
              '对话框4: GeneralDialog',
              () async {
                bool? result = await showCustomDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('提示'),
                        content: const Text('您确定要删除当前文件吗?'),
                        actions: [
                          TextButton(
                            child: const Text('取消'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('删除'),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          )
                        ],
                      );
                    });
                if (result == true) {
                  debugPrint('删除文件');
                } else {
                  debugPrint('取消删除');
                }
              },
            ),
            const SizedBox(height: 12),
            const DialogStateWidget(),
            const SizedBox(height: 12),
            _buildButton(
              "显示底部菜单列表(Material风格)",
              () async {
                int? type = await showModalBottomSheet<int>(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView.builder(
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("$index"),
                          onTap: () => Navigator.of(context).pop(index),
                        );
                      },
                    );
                  },
                );
                debugPrint('item: $type');
              },
            ),
            const SizedBox(height: 12),
            _buildButton(
              "Loading Dialog",
              () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.only(top: 26.0),
                            child: Text("正在加载，请稍后..."),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            _buildButton(
              "Loading Dialog2",
              () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const UnconstrainedBox(
                      constrainedAxis: Axis.vertical,
                      child: SizedBox(
                        width: 280,
                        child: AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Padding(
                                padding: EdgeInsets.only(top: 26.0),
                                child: Text("正在加载，请稍后..."),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            _buildButton(
              "日历选择弹框",
              () async {
                var date = DateTime.now();
                showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: date,
                  lastDate: date.add(const Duration(days: 30)),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildButton(
              "iOS 风格日历选择弹框",
              () async {
                var date = DateTime.now();
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return Container(
                        height: 300,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.dateAndTime,
                          onDateTimeChanged: (DateTime newDate) {
                            debugPrint("选择的日期: $newDate");
                          },
                          initialDateTime: date,
                          minimumDate: date,
                          maximumDate: date.add(const Duration(days: 30)),
                          maximumYear: date.year + 1,
                        ));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class DialogStateWidget extends StatefulWidget {
  const DialogStateWidget({super.key});

  @override
  _DialogDemoRouteState createState() => _DialogDemoRouteState();
}

class _DialogDemoRouteState extends State<DialogStateWidget> {
  bool withTree = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Text("对话框5: 删除确认对话框(带复选框)"),
        onPressed: () async {
          bool? delete = await showDeleteConfirmDialog5();
          if (delete == null) {
            print("取消删除");
          } else {
            print("同时删除子目录: $delete");
          }
        },
      ),
    );
  }

  Future<bool?> showDeleteConfirmDialog5() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  // Checkbox(
                  //   value: withTree,
                  //   onChanged: (bool? value) {
                  //     //复选框选中状态发生变化时重新构建UI
                  //     setState(() {
                  //       //更新复选框状态
                  //       withTree = !withTree;
                  //     });
                  //   },
                  // ),
                  // StatefulBuilder(builder: (context, setState) {
                  //   return Checkbox(
                  //       value: withTree,
                  //       onChanged: (bool? value) {
                  //         //复选框选中状态发生变化时重新构建UI
                  //         setState(() {
                  //           //更新复选框状态
                  //           withTree = !withTree;
                  //         });
                  //       });
                  // })
                  // Checkbox(
                  //   value: withTree,
                  //   onChanged: (bool? value) {
                  //       // 此时context为对话框UI的根Element，我们
                  //       // 直接将对话框UI对应的Element标记为dirty
                  //       (context as Element).markNeedsBuild();
                  //       withTree = !withTree;
                  //   },
                  // ),
                  // 通过Builder来获得构建Checkbox的`context`，
                  // 这是一种常用的缩小`context`范围的方式
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool? value) {
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }
}

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
  ThemeData? theme,
}) {
  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87,
    // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key? key,
    required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}
