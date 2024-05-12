import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Core/Constants/Image_Constants.dart';
import 'Controller/Splash_Controller.dart';

class Splash extends StatelessWidget {
  final SplashController _splashController=Get.put(SplashController());
  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Container(
        width: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstants.ImageSplash),
                fit: BoxFit.fill)),
      ),
    );
  }
}
