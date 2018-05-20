import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/videoGalleryModel.dart';

class YouTubeRepository{
  Future<List<VideoGalleryModel>> fetchList(String query) async {
    final maxResults = 10;
    query = query.replaceAll(' ', '+');
    final response = await http.get('https://www.googleapis.com/youtube/v3/search?key=AIzaSyDXpkxbEGoyn0rMXcr0w3tfbR4VBqmMySc&part=snippet&order=date&type=video&maxResults=$maxResults&q=$query', headers: {"Accept": "application/json"});
    final parsed = json.decode(response.body);
    return parsed['items'].map<VideoGalleryModel>((json) => new VideoGalleryModel.fromJson(json)).toList();
  }
}