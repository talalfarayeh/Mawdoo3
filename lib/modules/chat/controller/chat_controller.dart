import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:wodoo33/modules/chat/model/mesaage.dart';

class ChatController extends GetxController {
  final String apiUrl =
      'https://api-v2-iieslijxmq-ww.a.run.app/v1/chat/assistant';
  final String apiKey = 'talal_experimentation';
  var messages = <Message>[].obs;
  final TextEditingController textController = TextEditingController();

  void sendMessage() async {
    final userMessage = textController.text.trim();
    if (userMessage.isEmpty) return;

    messages.add(Message(role: 'user', content: userMessage));
    textController.clear();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'chat_history': messages
              .map((msg) => {
                    'role': msg.role,
                    'content': msg.content,
                  })
              .toList()
        }),
      );

      if (response.statusCode == 200) {
        messages.add(Message(
            role: 'ai', content: utf8.decode((response.body.codeUnits))));
        notifyChildrens();
      } else {
        throw Exception('Failed to get response');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
