import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:not_youtube/model/yt_video.dart';

const YOUTUBE_URL = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<YoutubeVideo>> search({String query = ""}) async {
    var url = "${YOUTUBE_URL}search"
        "?part=snippet"
        "&channelId=$GAULES_CHANNEL"
        "&maxResults=20"
        "&order=date"
        "&type=video"
        "&q=$query"
        "&key=$YOUTUBE_API_KEY";

    var response = await http.get(
      Uri.parse(url),
    );

    if(response.statusCode == 200) {
      Map<String, dynamic> bodyJson = json.decode(response.body);

      List<YoutubeVideo> videos = bodyJson["items"].map<YoutubeVideo>(
          (videoJson) {
            return YoutubeVideo.fromJson(videoJson);
          }
      ).toList();

      return videos;
    }
    else {
      print("Error}");
      return [];
    }
  }

}