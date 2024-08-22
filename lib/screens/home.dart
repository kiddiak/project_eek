import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project_eek/layouts/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({    
    super.key,
  });
  
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Socket? socket;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _connectToServer();
  }

  void _connectToServer() async {
    try {
      socket = await Socket.connect(Platform.isAndroid ? "10.0.2.2" : "127.0.0.1", 4444);
      socket?.listen((data) {
        Uint8List uint8List = Uint8List.fromList(data);
        String decodedString = utf8.decode(uint8List);
        print(decodedString);
      },
      onDone: () {
        print('onDone');
        socket?.destroy();
      });
      print('Connected');
    } catch (e) {
      print('Error: $e');
    }
  }

  void _sendMessage() {
    String message = _controller.text;
    socket?.write(message + '\n');
    _controller.clear();
  }

  @override
  void dispose() {
    socket?.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter message',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _sendMessage,
              child: const Text('Send'),
            ),
          ],
        )
      )
    );
  }
}