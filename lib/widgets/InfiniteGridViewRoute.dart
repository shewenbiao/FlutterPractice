import 'package:flutter/material.dart';

class InfiniteGridViewRoute extends StatefulWidget {
  const InfiniteGridViewRoute({super.key});

  @override
  State<InfiniteGridViewRoute> createState() => _InfiniteGridViewRouteState();
}

class _InfiniteGridViewRouteState extends State<InfiniteGridViewRoute> {
  final List<ItemData> _items = [];
  static const int _pageSize = 20;
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMoreData();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    // 模拟网络请求延迟
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _items.addAll(
        List.generate(
          _pageSize,
          (index) => ItemData(
            id: _items.length + index,
            color: Colors.primaries[(_items.length + index) % Colors.primaries.length],
          ),
        ),
      );
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('无限滚动网格'),
      ),
      body: Column(
        children: [
          // 说明部分
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue[50],
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue[700]),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    '向下滚动时会自动加载更多内容，实现无限滚动效果',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),

          // 网格列表
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: _items.length + 1,  // +1 为了显示加载指示器
              itemBuilder: (context, index) {
                if (index == _items.length) {
                  return _buildLoadingIndicator();  // 加载指示器
                }
                return _buildGridItem(_items[index]);  // 网格项
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(ItemData item) {
    return Container(
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.grid_view,
              size: 40,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '项目 ${item.id + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      width: double.infinity,  // 使加载指示器充满宽度
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            '正在加载更多...',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemData {
  final int id;
  final Color color;

  ItemData({
    required this.id,
    required this.color,
  });
}
