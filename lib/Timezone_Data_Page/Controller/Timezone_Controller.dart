import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/model_page.dart'; // Import the TimeZone model

class TimeZoneController extends GetxController {
  var selectedTimeZone = TimeZone('', 'Loading...').obs;

  Future<void> fetchTime(String timeZone) async {
    try {
      final response = await http.get(
        Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$timeZone'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        selectedTimeZone.value = TimeZone(timeZone, data['dateTime']);
      } else {
        selectedTimeZone.value = TimeZone('', 'Failed to fetch time');
      }
    } catch (error) {
      selectedTimeZone.value = TimeZone('', 'Error: $error');
    }
  }
}
