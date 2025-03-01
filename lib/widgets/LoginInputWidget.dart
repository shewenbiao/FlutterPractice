import 'package:flutter/material.dart';

class LoginInputWidget extends StatefulWidget {
  const LoginInputWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginInputWidgetState();
  }
}

class _LoginInputWidgetState extends State<LoginInputWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.text = 'admin';
    _usernameController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _usernameController.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: '用户名',
            hintText: '请输入用户名',
            prefixIcon: Icon(Icons.person),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: '密码',
            hintText: '请输入密码',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            debugPrint(
                'username: ${_usernameController.text}, password: ${_passwordController.text}');
          },
          child: const Text('登录'),
        ),
      ],
    );
    // return Theme(
    //     data: Theme.of(context).copyWith(
    //         hintColor: Colors.red, //定义下划线颜色
    //         inputDecorationTheme: const InputDecorationTheme(
    //             labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
    //             hintStyle:
    //                 TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式, 覆盖 hintColor
    //             )),
    //     child: Column(
    //       children: [
    //         TextField(
    //           autofocus: true,
    //           controller: _usernameController,
    //           decoration: const InputDecoration(
    //             labelText: '用户名',
    //             hintText: '请输入用户名',
    //             prefixIcon: Icon(Icons.person),
    //             enabledBorder: UnderlineInputBorder(
    //               borderSide: BorderSide(color: Colors.grey),
    //             ),
    //             focusedBorder: UnderlineInputBorder(
    //               borderSide: BorderSide(color: Colors.blue),
    //             ),
    //           ),
    //         ),
    //         TextField(
    //           controller: _passwordController,
    //           obscureText: true,
    //           decoration: const InputDecoration(
    //             labelText: '密码',
    //             hintText: '请输入密码',
    //             prefixIcon: Icon(Icons.lock),
    //           ),
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             debugPrint(
    //                 'username: ${_usernameController.text}, password: ${_passwordController.text}');
    //           },
    //           child: const Text('登录'),
    //         ),
    //       ],
    //     ));
  }
}