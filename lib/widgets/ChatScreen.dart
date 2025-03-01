import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = []; // 存储消息列表
  final TextEditingController _controller = TextEditingController(); // 输入框控制器
  final ImagePicker _picker = ImagePicker(); // 用于选择图片

  // 模拟发送文字消息
  void _sendMessage(String message) {
    if (message.trim().isEmpty) return; // 输入为空时不发送
    setState(() {
      _messages.add({'type': 'text', 'content': message, 'isUser': true});
    });

    _simulateBotReply('文字消息：$message');
    _controller.clear(); // 清空输入框
  }

  // 模拟发送图片消息
  Future<void> _sendImageMessage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return; // 如果用户取消选择

    setState(() {
      _messages.add({'type': 'image', 'content': pickedFile.path, 'isUser': true});
    });

    _simulateBotReply('收到图片！');
  }

  // 模拟发送语音消息
  void _sendVoiceMessage() {
    setState(() {
      _messages.add({'type': 'voice', 'content': '语音：3秒', 'isUser': true});
    });

    _simulateBotReply('语音消息收到！');
  }

  // 模拟机器人回复
  void _simulateBotReply(String reply) {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _messages.add({'type': 'text', 'content': reply, 'isUser': false});
      });
    });
  }

  // 渲染单条消息
  Widget _buildMessage(Map<String, dynamic> message) {
    final isUserMessage = message['isUser'] as bool;
    final type = message['type'] as String;
    final content = message['content'];

    // 消息内容样式
    Widget messageContent;
    if (type == 'text') {
      messageContent = Text(
        content,
        style: const TextStyle(fontSize: 16),
      );
    } else if (type == 'image') {
      messageContent = Image.file(
        File(content),
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    } else if (type == 'voice') {
      messageContent = Text(
        content,
        style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      );
    } else {
      messageContent = const Text('未知消息类型');
    }

    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.green[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: messageContent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('聊天示例'),
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          // 消息显示区域
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          // 输入框和操作按钮
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo),
                  onPressed: _sendImageMessage, // 选择图片发送
                ),
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: _sendVoiceMessage, // 模拟发送语音
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '请输入消息...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.teal),
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
