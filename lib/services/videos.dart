//import 'package:midterm_project/model/allvideos.dart';
import 'package:riverpod/riverpod.dart';

class VideoService {
  final Ref container;
  final List<Map<String, String>> _videos = [
    {
      "title": "Infinity Train: Book 3",
      "channel": "Owen Dennis",
      "thumbnail":
          'https://m.media-amazon.com/images/S/pv-target-images/061315f20dc4861934bd9dda8cee4e8a2015415068478e73297c14b8b17f0f01.jpg',
      "views": "1.2M views",
      "time": "2 days ago",
    },
    {
      "title": "Don't Hug Me I'm Scared (2022 TV Series)",
      "channel": "Becky Sloan and Joe Pelling.",
      "thumbnail":
          'https://i.guim.co.uk/img/media/4906e92649711c232411c202112779b117003a1a/0_251_6390_3834/master/6390.jpg?width=1200&quality=85&auto=format&fit=max&s=965cbaccaac7866c9100b9689bfa89b2',
      "views": "500K views",
      "time": "1 week ago",
    },
    {
      "title": "Learning with Pibby",
      "channel": "Dodge Aloysius Greenley",
      "thumbnail":
          "https://m.media-amazon.com/images/M/MV5BZTlmNDI0YWItNzE2Ni00NDFmLTk5ZjUtYzM0YTg1MWY1NjkzXkEyXkFqcGc@._V1_.jpg",
      "views": "250K views",
      "time": "3 weeks ago",
    },
  ];

  VideoService(this.container);

  void addVideos(String title, String channel, String thumbnail, String views,
      String time) {
    final newVideo = {
      "title": title,
      "channel": channel,
      "thumbnail": thumbnail,
      "views": views,
      "time": time,
    };

    _videos.add(newVideo);
  }

  // void viewPlayers() {
  //   int place = 0;
  //   for (var player in _videos) {
  //     place++;
  //     if (place > 10) {
  //       break;
  //     }
  //     print("$place. $player");
  //   }
  // }

  List<Map<String, String>> getVideos() {
    return _videos;
  }
}
