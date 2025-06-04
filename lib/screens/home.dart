import 'package:flutter/material.dart';
import 'package:not_youtube/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Api().search(query: "IEM");
    
    return Center(
      child: Text(
        "Home",
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}
