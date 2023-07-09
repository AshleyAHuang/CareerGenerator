// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:transizion_flutter/completions_response.dart';
import 'package:transizion_flutter/completions_request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert' show utf8;


class CompletionsAPI {
  static final Uri completionsEndpoint =
      Uri.parse('https://api.openai.com/v1/completions');

  

  

  static Future<CompletionsResponse> generateCareer(String education, String careerPath, String hollandCode) async {
    await dotenv.load(fileName: "dotenv");
    // final apiKeyENV =  DotEnv().env['API_KEY'];

    final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
  };

    String prompt = '5 detailed occupations with descriptions as a $education graduate looking to work in the $careerPath';

    if (hollandCode.isNotEmpty) {
      prompt = '5 detailed occupations with descriptions as a $education graduate looking to work in the $careerPath. My holland codes include $hollandCode';
    }

    prompt += "Use second person.";
    
    CompletionsRequest request = CompletionsRequest(
        model: 'text-davinci-003',
        prompt: prompt,
        temperature: 0.6,
        maxTokens: 3354,
        topP: 0.77,
        frequencyPenalty: 0,
        presencePenalty: 1.6);

    http.Response response = await http.post(completionsEndpoint,
    headers: headers, body: utf8.encode(request.toJson()));
    debugPrint("BODY! ${response.body}");
    var jsonResponse = jsonDecode(response.body);
    debugPrint("Using model: ${jsonResponse['choices'][0]['text']}");

    // Check to see if there was an error
    if (response.statusCode != 200) {
      debugPrint(
          'Failed to get a forecast with status code, ${response.statusCode}');
    }
    CompletionsResponse completionsResponse =
        CompletionsResponse.fromResponse(response);
    return completionsResponse;
  }
}

Future<bool> myTypedFuture(int id, int duration) async {
  await Future.delayed(Duration(seconds: duration));
  debugPrint("delay complete for future $id");
  return true;
}


