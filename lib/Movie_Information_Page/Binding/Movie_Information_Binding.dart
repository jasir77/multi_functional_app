import 'package:get/get.dart';
import '../Controller/Movie_Information_Controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController());
  }
}