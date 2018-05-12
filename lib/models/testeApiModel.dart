class TesteApiModel{
  int userId;
  int id;
  String title;
  String body;

  TesteApiModel({this.userId, this.id, this.title, this.body});

  factory TesteApiModel.fromJson(Map<String, dynamic> json) {
    return new TesteApiModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}