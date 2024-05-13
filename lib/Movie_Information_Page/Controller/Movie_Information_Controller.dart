import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<dynamic> searchResults = <dynamic>[].obs; // Use RxList for reactivity
  void onInit() {
    super.onInit();
    // Load latest movies when the controller is initialized
    searchBatman("latest"); // Pass an empty string to load the latest movies
  }
  Future<void> searchBatman(String searchTerm) async {
    final Uri uri = Uri.parse('https://www.omdbapi.com/?s=$searchTerm&apikey=4ed24780');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decodedBody = json.decode(response.body);
      if (decodedBody['Search'] != null) {
        // Update searchResults using the value property of the RxList
        searchResults.value = decodedBody['Search'];
      } else {
        // If 'Search' is null, clear searchResults
        searchResults.clear();
      }
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
