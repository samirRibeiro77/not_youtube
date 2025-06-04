class YoutubeVideo {
  late String _id, _title, _description, _thumbnail, _channelTitle, _publishTime;

  YoutubeVideo.fromJson(Map<String, dynamic> json) {
    _id = json["id"]["videoId"];
    _title = json["snippet"]["title"];
    _description = json["snippet"]["description"];
    _thumbnail = json["snippet"]["thumbnails"]["high"]["url"];
    _channelTitle = json["snippet"]["channelTitle"];
    _publishTime = json["snippet"]["publishTime"];
  }

  get publishTime => _publishTime;

  get channelTitle => _channelTitle;

  get thumbnail => _thumbnail;

  get description => _description;

  get title => _title;

  String get id => _id;
}