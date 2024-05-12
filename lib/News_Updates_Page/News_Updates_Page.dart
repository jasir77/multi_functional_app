import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NewsSearchPage extends StatefulWidget {
  @override
  _NewsSearchPageState createState() => _NewsSearchPageState();
}

class _NewsSearchPageState extends State<NewsSearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _newsArticles = [];

  Future<void> _searchNews(String searchTerm) async {
    final Uri uri = Uri.parse('https://newsapi.org/v2/everything?q=$searchTerm&apiKey=58b3ac798dee43cicada656bae0f60b');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      setState(() {
        _newsArticles = json.decode(response.body)['articles'];
      });
    } else {
      throw Exception('Failed to load news articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search News',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchNews(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _newsArticles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_newsArticles[index]['title']),
                  subtitle: Text(_newsArticles[index]['description'] ?? ''),
                  leading: _newsArticles[index]['urlToImage'] != null
                      ? Image.network(_newsArticles[index]['urlToImage'])
                      : Container(), // Show a placeholder if no image available
                  onTap: () {
                    // Open full news article in a browser or in a WebView
                    // Example: launchURL(_newsArticles[index]['url']);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
