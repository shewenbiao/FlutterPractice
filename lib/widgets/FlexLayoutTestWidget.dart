import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatelessWidget {
  const FlexLayoutTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('弹性布局示例'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 水平布局示例
              _buildSectionTitle('水平布局 (Row)'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[100]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('均匀分布：', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildColorBox('1', Colors.red),
                        _buildColorBox('2', Colors.green),
                        _buildColorBox('3', Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('两端对齐：', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildColorBox('1', Colors.orange),
                        _buildColorBox('2', Colors.purple),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Column 垂直布局示例
              _buildSectionTitle('垂直布局 (Column)'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green[100]!),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _buildColorBox('1', Colors.red, size: 40),
                          const SizedBox(height: 8),
                          _buildColorBox('2', Colors.green, size: 40),
                          const SizedBox(height: 8),
                          _buildColorBox('3', Colors.blue, size: 40),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text('垂直\n排列', textAlign: TextAlign.center),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Expanded 示例
              _buildSectionTitle('弹性布局 (Expanded)'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purple[100]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('不同比例：', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: _buildColorBox('1', Colors.red, height: 60),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: _buildColorBox('2', Colors.green, height: 60),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: _buildColorBox('3', Colors.blue, height: 60),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('flex: 1, 2, 3', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 实际应用示例
              _buildSectionTitle('实际应用'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange[100]!),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '用户名',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '这是一条用户消息示例',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('回复'),
                        ),
                      ],
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildColorBox(String text, Color color, {double size = 50, double? height}) {
    return Container(
      width: size,
      height: height ?? size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}