import 'package:flutter/material.dart';

class YoutubeSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            close(context, "");
          },
          icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, "");
        },
        icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = ["Type to search"];
    if(query.isNotEmpty) {
      suggestionList = [
        "IEM", "Blast", "Furia", "Kings League", "G3X"
      ].where(
              (text) => text.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }

    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, suggestionList[index]);
              },
              title: Text(suggestionList[index]),
            );
          }
      ),
    );
  }
}