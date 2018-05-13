class SchedulesModel{
  String urlImage;
  String title;
  String firstDescription;
  String description;

  SchedulesModel(this.urlImage, this.title, this.firstDescription, this.description);

  factory SchedulesModel.fromJson(Map<String, dynamic> json){
    return new SchedulesModel(
     json[''],
     json[''],
     json[''],
     json['']
    );
  }
}