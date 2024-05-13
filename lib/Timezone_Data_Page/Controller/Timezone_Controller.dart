import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TimezoneController extends GetxController {
  var currentTime = ''.obs;

  Future<void> fetchTime(String timeZone) async {
    final Uri uri = Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$timeZone');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decodedBody = response.body;
      currentTime.value = decodedBody;
    } else {
      throw Exception('Failed to load time data');
    }
  }
}
