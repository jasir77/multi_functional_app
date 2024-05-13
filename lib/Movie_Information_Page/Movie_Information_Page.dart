import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_functional_app/Movie_Information_Page/Controller/Movie_Information_Controller.dart';

class MoviePage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: movieController.searchController,
              decoration: InputDecoration(
                labelText: 'Search Movies',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    movieController.searchBatman(movieController.searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: movieController.searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(movieController.searchResults[index]['Poster']),
                    title: Text(movieController.searchResults[index]['Title']),
                    subtitle: Text(movieController.searchResults[index]['Year']),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
