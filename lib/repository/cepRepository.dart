import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/CepModel.dart';

class CepRepository{
  Future<CepModel> fetchCep(String cep) async {
    final response = await new http.Client().get('https://viacep.com.br/ws/$cep/json/');
    final parsed = json.decode(response.body);
    var objCep = CepModel.fromJson(parsed);
    return objCep;
  }
}