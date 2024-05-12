
import 'package:get/get.dart';
import 'package:multi_functional_app/Login_Page/Controller/Login_Controller.dart';

class loginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<loginController>(() => loginController());
  }
}