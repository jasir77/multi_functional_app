import 'package:get/get.dart';
import '../Controller/News_Updates_Controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
  }
}