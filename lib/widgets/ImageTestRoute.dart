import 'package:flutter/material.dart';

// 在类的开头定义一些常量图片URL
const String _networkImageUrl1 = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg';  // 猫头鹰图片
const String _networkImageUrl2 = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg';  // 另一张猫头鹰图片
const String _networkImageUrl3 = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg';  // 猎鹰图片

class ImageTestRoute extends StatelessWidget {
  const ImageTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('图片组件示例'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 本地图片示例
              _buildSectionTitle('本地图片', '从 assets 目录加载'),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'images/avatar.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, size: 40),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '加载方式：Image.asset(\'images/avatar.jpg\')',
                style: TextStyle(color: Colors.grey),
              ),
              
              const SizedBox(height: 32),
              
              // 网络图片示例
              _buildSectionTitle('网络图片', '从网络URL加载'),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildNetworkImage(
                    'Image.network 加载',
                  ),
                  const SizedBox(width: 16),
                  _buildNetworkImage(
                    'FadeInImage 渐显加载',
                    useFadeIn: true,
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // 图片缓存示例
              _buildSectionTitle('图片缓存', '使用 cached_network_image 包'),
              const SizedBox(height: 10),
              _buildNetworkImage(
                '带缓存的网络图片加载',
                showCache: true,
              ),
              
              const SizedBox(height: 32),
              
              // 图片适应模式示例
              _buildSectionTitle('图片适应模式', '不同的 BoxFit 效果'),
              const SizedBox(height: 10),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: BoxFit.values
                    .where((fit) => fit != BoxFit.none)
                    .map((fit) => _buildFitExample(fit))
                    .toList(),
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
            fontSize: 18,
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

  Widget _buildNetworkImage(String description, {
    bool useFadeIn = false,
    bool showCache = false,
  }) {
    final imageUrl = useFadeIn ? _networkImageUrl2 : _networkImageUrl1;
    
    Widget image;
    if (useFadeIn) {
      image = Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator()),
          ),
          Image.network(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
                child: child,
              );
            },
            errorBuilder: (context, error, stackTrace) => Container(
              width: 100,
              height: 100,
              color: Colors.grey[200],
              child: const Icon(Icons.broken_image, size: 40),
            ),
          ),
        ],
      );
    } else {
      image = Image.network(
        imageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: 100,
            height: 100,
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          width: 100,
          height: 100,
          color: Colors.grey[200],
          child: const Icon(Icons.broken_image, size: 40),
        ),
      );
    }

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: image,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 100,
          child: Text(
            description,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildFitExample(BoxFit fit) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network(
              _networkImageUrl3,  // 使用第三个示例图片
              fit: fit,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          fit.toString().split('.').last,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

// 添加一个新的示例图片组件
class DemoImage extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final IconData icon;

  const DemoImage({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            color.withOpacity(0.8),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: width * 0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}
