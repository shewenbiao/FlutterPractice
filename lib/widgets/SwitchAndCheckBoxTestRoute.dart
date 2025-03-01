import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  const SwitchAndCheckBoxTestRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SwitchAndCheckBoxTestRouteState();
  }
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchValue = false;
  bool? _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _switchValue,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxValue,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              _checkboxValue = value;
            });
          },
        ),
      ],
    );
  }
}