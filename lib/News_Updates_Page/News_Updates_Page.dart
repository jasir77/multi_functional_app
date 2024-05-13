import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/News_Updates_Controller.dart';

class NewsScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: newsController.textEditingController,
              decoration: InputDecoration(
                hintText: 'search news',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    newsController.searchNews(newsController.textEditingController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: newsController.articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(newsController.articles[index].title),
                  subtitle: Text(newsController.articles[index].description ?? ''),
                  leading: newsController.articles[index].imageUrl != null
                      ? Image.network(
                    newsController.articles[index].imageUrl!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                      : SizedBox.shrink(),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
