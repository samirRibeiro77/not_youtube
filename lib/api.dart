import 'package:http/http.dart' as http;
import 'package:not_youtube/api_key.dart';
import 'dart:convert';
import 'package:not_youtube/model/yt_video.dart';

const YOUTUBE_URL = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<YoutubeVideo>> search({String query = ""}) async {
    var channel = ApiKey.ytChannel != "" ? "&channelId=${ApiKey.ytChannel}" : "";
    var url = "${YOUTUBE_URL}search"
        "?part=snippet"
        "$channel"
        "&maxResults=20"
        "&order=date"
        "&type=video"
        "&q=$query"
        "&key=${ApiKey.youtube}";

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