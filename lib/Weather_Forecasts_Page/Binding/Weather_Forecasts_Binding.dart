import 'package:get/get.dart';
import '../Controller/Weather_Forecasts_Controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(() => WeatherController());
  }
}