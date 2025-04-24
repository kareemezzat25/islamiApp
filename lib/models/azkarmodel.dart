import 'dart:convert';

import 'package:flutter/services.dart';

class Azkar {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String content;

  Azkar({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory Azkar.fromJson(Map<String, dynamic> json) {
    return Azkar(
      category: json['category'] ?? '',
      count: json['count'] ?? '',
      description: json['description'] ?? '',
      reference: json['reference'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'count': count,
      'description': description,
      'reference': reference,
      'content': content,
    };
  }

  static Future<List<Azkar>> loadAzkar(String azkarType) async {
    var fileContent =
        await rootBundle.loadString("assets/files/azkar/azkar.json");
    Map<String, dynamic> file = jsonDecode(fileContent);
    if (file[azkarType] is List) {
      List<Azkar> azkar =
          (file[azkarType] as List).map((e) => Azkar.fromJson(e)).toList();
      return azkar;
    } else {
      throw Exception("Azkar Not Found");
    }
  }
}
