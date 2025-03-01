import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  const FormTestRoute({super.key});

  @override
  State<FormTestRoute> createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  
  // 添加单选框和复选框的状态
  int _radioGroupValue = 1; // 单选框组的值
  bool _checkboxSelected = true; // 复选框的选中状态
  final List<bool> _checkboxListSelected = <bool>[false, false, false]; // 复选框列表的选中状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('表单组件示例'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (v) {
                  return v!.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              
              // 添加单选框演示
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Text('单选框示例：', style: TextStyle(fontSize: 16)),
              ),
              Row(
                children: <Widget>[
                  Radio<int>(
                    value: 1,
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value!;
                      });
                    },
                  ),
                  const Text('选项1'),
                  Radio<int>(
                    value: 2,
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value!;
                      });
                    },
                  ),
                  const Text('选项2'),
                ],
              ),
              
              // 添加复选框演示
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text('复选框示例：', style: TextStyle(fontSize: 16)),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _checkboxSelected,
                    onChanged: (value) {
                      setState(() {
                        _checkboxSelected = value!;
                      });
                    },
                  ),
                  const Text('同意协议'),
                ],
              ),
              
              // 添加复选框列表演示
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text('复选框列表示例：', style: TextStyle(fontSize: 16)),
              ),
              Wrap(
                children: List<Widget>.generate(
                  3,
                  (index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: _checkboxListSelected[index],
                        onChanged: (value) {
                          setState(() {
                            _checkboxListSelected[index] = value!;
                          });
                        },
                      ),
                      Text('选项${index + 1}'),
                      const SizedBox(width: 16.0),
                    ],
                  ),
                ),
              ),
              
              // 提交按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("提交"),
                        ),
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            // 验证通过提交数据
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}