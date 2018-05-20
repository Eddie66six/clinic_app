import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/videoGalleryModel.dart';
import '../../repository/youTubeRepository.dart';
import '../../systemLoading.dart';
import 'RowList.dart';

class VideoGalleryScreen extends StatefulWidget {
  VideoGalleryScreen(this.size);
  final Size size;
  @override
  VideoGalleryScreenState createState() => new VideoGalleryScreenState();
}

class VideoGalleryScreenState extends State<VideoGalleryScreen> {
  var videos = new List<VideoGalleryModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration.zero, () {
      SystemLoading.onLoadingShow(context);
      _onRefresh().then((_) {
        print('pronto');
        SystemLoading.onLoadingHide(context);
      });
    });
  }

  Future<Null> _onRefresh() async {
    var result = await new YouTubeRepository().fetchList('shurato abertura');
    setState(() {
      print('carregado..');
      videos = result;
    });
  }

   @override
  Widget build(BuildContext context) {
    return new Expanded(
        flex: 1,
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new RefreshIndicator(
                onRefresh: _onRefresh,
                child: new ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    return new RowList(
                        videos[index].urlVideo,
                        videos[index].title,
                        videos[index].thumbnail);
                  },
                ),
              ),
            )
          ],
        ));
  }
}
