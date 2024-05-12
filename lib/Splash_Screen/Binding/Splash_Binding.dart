import 'package:get/get.dart';
import '../Controller/Splash_Controller.dart';

class Splashbinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SplashController>(() => SplashController());
  }
}