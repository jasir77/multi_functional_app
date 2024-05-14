import 'package:get/get.dart';
import '../Controller/Timezone_Controller.dart';

class TimezoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimeZoneController>(() => TimeZoneController());
  }
}