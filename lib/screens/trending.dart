import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Trending",
        style: TextStyle(
            fontSize: 25
        ),
      ),
    );
  }
}
