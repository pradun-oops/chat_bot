import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:lyra/helper/global.dart';

class Apis {
  static Future<String> getAnswer(String question) async {
    try {
      final res = await post(
        Uri.parse('https://api.aimlapi.com/v1/chat/completions'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "deepseek/deepseek-r1",
          "max_tokens": 2000,
          "temperature": 0,
          "messages": [
            {"role": "user", "content": question},
          ],
        }),
      );
      final data = jsonDecode(res.body);
      log("Response : $data");
      return data['choices'][0]['message']['content'];
    } catch (e) {
      log("getAnswerE : $e");
      return "Something went wrong (try again in sometime)";
    }
  }
}
