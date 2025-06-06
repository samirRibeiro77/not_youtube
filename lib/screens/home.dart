import 'package:flutter/material.dart';
import 'package:not_youtube/api.dart';
import 'package:not_youtube/model/yt_video.dart';
import 'package:not_youtube/screens/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.query});

  final String query;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YoutubeVideo>>(
        future: Api().search(query: widget.query),
        builder: (context, snapshot){
          switch(snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("API error: ${snapshot.error}"),
                );
              }
              return ListView.separated(
                  itemBuilder: (context, index) {
                    var video = snapshot.data?[index];
                    return GestureDetector(
                      onTap: () {
                        print("Executing videoId: ${video!.id}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlayer(video: video)
                            )
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video?.thumbnail)
                                )
                            ),
                          ),
                          ListTile(
                            title: Text(video?.title),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(video?.channelTitle),
                                Text("${video?.publishTime.day}"
                                    "/${video?.publishTime.month}"
                                    "/${video?.publishTime.year}")
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 3,
                    color: Colors.red,
                  ),
                  itemCount: snapshot.data!.length
              );
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        }
    );
  }
}
