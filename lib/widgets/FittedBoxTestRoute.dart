import 'package:first_flutter_app/widgets/SingleLineFittedBox.dart';
import 'package:flutter/material.dart';

class FittedBoxTestRoute extends StatelessWidget {
  const FittedBoxTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FittedBox Test'),
        ),
        body: Center(
          child: Column(
            children: [
              wRow(' 90000000000000000 '),
              FittedBox(child: wRow(' 90000000000000000 ')),
              wRow(' 800 '),
              FittedBox(child: wRow(' 800 ')),
              SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
              SingleLineFittedBox(child: wRow(' 800 '))
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: e,
                    ))
                .toList(),
          ),
        ));
  }
}

// 直接使用Row
Widget wRow(String text) {
  Widget child = Text(text);
  child = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
  return child;
}
