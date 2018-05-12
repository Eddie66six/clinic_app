import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/testeApiModel.dart';

class TesteRepository{
  Future<List<TesteApiModel>> fetchTeste() async {
    final response = await new http.Client().get('https://jsonplaceholder.typicode.com/photos');
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<TesteApiModel>((json) => new TesteApiModel.fromJson(json)).toList();
  }
}