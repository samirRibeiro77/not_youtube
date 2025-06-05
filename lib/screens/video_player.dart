import 'package:flutter/material.dart';
import 'package:not_youtube/model/yt_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.video});

  final YoutubeVideo video;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  var _hideAppbar = false;

  late final _controller = YoutubePlayerController(
    initialVideoId: widget.video.id,
    flags: YoutubePlayerFlags(autoPlay: true, mute: false),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _hideAppbar ? null : AppBar(title: Text(widget.video.title)),
      body: YoutubePlayerBuilder(
        onEnterFullScreen: () {
          setState(() {
            _hideAppbar = true;
          });
        },
        onExitFullScreen: () {
          setState(() {
            _hideAppbar = false;
          });
        },
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
              player,
              //some other widgets
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
