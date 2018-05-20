class VideoGalleryModel{
  String urlVideo;
  String title;
  String thumbnail;

  VideoGalleryModel(this.urlVideo, this.title, this.thumbnail);

  factory VideoGalleryModel.fromJson(Map<String, dynamic> json){
    return new VideoGalleryModel(
     'https://www.youtube.com/watch?v=' + json['id']['videoId'],
     json['snippet']['title'],
     json['snippet']['thumbnails']['medium']['url'],
    );
  }
}