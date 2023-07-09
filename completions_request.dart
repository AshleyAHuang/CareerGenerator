import 'dart:convert';

class CompletionsRequest {
  final String model;
  final String prompt;
  final double? temperature;
  final int maxTokens;
  final double? topP;
  final double? frequencyPenalty;
  final double? presencePenalty;

  CompletionsRequest({
    required this.model,
    required this.prompt,
    required this.maxTokens,

    this.temperature,
    this.topP,
    this.frequencyPenalty,
    this.presencePenalty
  });
  // final int? n;
  // final bool? stream;
  // final int? longprobs;
  // final String? stop;

  String toJson() {
    Map<String, dynamic> jsonBody = {
      'model': model,
      'prompt': prompt,
      'max_tokens': maxTokens,
    };

    if (temperature != null) {
      jsonBody.addAll({'temperature': temperature});
    }
    if (topP != null) {
      jsonBody.addAll({'top_p': topP});
    }
    if (frequencyPenalty != null) {
      jsonBody.addAll({'frequency_penalty': frequencyPenalty});
    }
    if (presencePenalty != null) {
      jsonBody.addAll({'presence_penalty': presencePenalty});
    }

    return json.encode(jsonBody);
  }
}

