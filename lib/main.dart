import 'package:flutter/material.dart';
import 'package:not_youtube/home_app.dart';

void main() {
  runApp(const YoutubeApp());
}

class YoutubeApp extends StatelessWidget {
  const YoutubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube sjr77',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const HomeApp(),
    );
  }
}
