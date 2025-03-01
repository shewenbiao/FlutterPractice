import 'package:flutter/material.dart';

class ProgressIndicatorTestRoute extends StatefulWidget {
  const ProgressIndicatorTestRoute({super.key});

  @override
  State<ProgressIndicatorTestRoute> createState() => _ProgressIndicatorTestRouteState();
}

class _ProgressIndicatorTestRouteState extends State<ProgressIndicatorTestRoute> {
  double _progress = 0.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('进度指示器示例'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 环形进度指示器
              _buildSectionTitle('环形进度指示器', 'CircularProgressIndicator'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 不确定进度
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('不确定进度'),
                    ],
                  ),
                  // 确定进度
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            value: _progress,
                            backgroundColor: Colors.grey[300],
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('确定进度'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // 线性进度指示器
              _buildSectionTitle('线性进度指示器', 'LinearProgressIndicator'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // 不确定进度
                    const LinearProgressIndicator(),
                    const SizedBox(height: 16),
                    // 确定进度
                    LinearProgressIndicator(
                      value: _progress,
                      backgroundColor: Colors.grey[300],
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 自定义样式示例
              _buildSectionTitle('自定义样式', '自定义颜色和大小'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // 自定义环形进度条
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(
                        value: _progress,
                        strokeWidth: 8,
                        backgroundColor: Colors.purple[100],
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 自定义线性进度条
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox(
                        height: 8,
                        child: LinearProgressIndicator(
                          value: _progress,
                          backgroundColor: Colors.purple[100],
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 进度控制
              _buildSectionTitle('进度控制', '使用滑块控制进度'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Slider(
                      value: _progress,
                      onChanged: (value) {
                        setState(() {
                          _progress = value;
                        });
                      },
                    ),
                    Text('当前进度: ${(_progress * 100).toStringAsFixed(1)}%'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
} 