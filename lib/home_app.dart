import 'package:flutter/material.dart';
import 'package:not_youtube/screens/home.dart';
import 'package:not_youtube/screens/library.dart';
import 'package:not_youtube/screens/subscriptions.dart';
import 'package:not_youtube/screens/trending.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screens = [
      Home(),
      Trending(),
      Subscriptions(),
      Library(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              onPressed: (){
                print("Action: VideoCam");
              },
              icon: Icon(Icons.videocam)
          ),
          IconButton(
              onPressed: (){
                print("Action: Search");
              },
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){
                print("Action: Account");
              },
              icon: Icon(Icons.account_circle)
          )
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                label: "Trending",
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                label: "Subscriptions",
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
                label: "Library",
                icon: Icon(Icons.folder)
            ),
          ]
      ),
    );
  }
}
