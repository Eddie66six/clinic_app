class CepModel{
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;
  String gia;

  CepModel({this.cep, this.logradouro,this.complemento, this.bairro, this.localidade, this.uf, this.unidade, this.ibge, this.gia});
  factory CepModel.fromJson(Map<String, dynamic> json){
    return new CepModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      unidade: json['unidade'],
      ibge: json['ibge'],
      gia: json['gia']
    );
  }
}