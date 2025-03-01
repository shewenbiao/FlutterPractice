import 'package:flutter/material.dart';

class AnimationDemoPage extends StatefulWidget {
  const AnimationDemoPage({super.key});

  @override
  _AnimationDemoPageState createState() => _AnimationDemoPageState();
}

class _AnimationDemoPageState extends State<AnimationDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation; // 新增透明度动画
  bool _isAnimating = true; // 用于跟踪动画状态

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // 循环动画

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(_controller);
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller); // 透明度动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value, // 使用透明度动画
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value * 2 * 3.14159, // 旋转动画
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            '动画效果',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_isAnimating) {
                    _controller.stop();
                  } else {
                    _controller.repeat(reverse: true);
                  }
                  _isAnimating = !_isAnimating; // 切换动画状态
                });
              },
              child: Text(_isAnimating ? '停止动画' : '开始动画'), // 根据状态更新按钮文案
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 重置动画
                _controller.reset();
                _controller.forward(); // 重新开始动画
                _controller.repeat(reverse: true); // 确保动画继续循环
                setState(() {
                  _isAnimating = true; // 重置时设置为动画状态
                });
              },
              child: const Text('重置动画'),
            ),
          ],
        ),
      ),
    );
  }
} 