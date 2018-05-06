import 'dart:convert';

import 'dart:io';

class HttpResult{
  HttpResult(this.error,this.data);
  bool error;
  dynamic data;
}

class Cep {
  getAdress (String cep) async {
    var data;
    var error = false;
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var contents = await response.transform(UTF8.decoder).join();
        data = contents;
      }
      httpClient.close();
      return new HttpResult(error, data);
    } catch (e) {
      return new HttpResult(true, e.message);
    }
  }
}
