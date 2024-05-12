import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Routes/App_Pages.dart';
import 'Routes/App_Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.Lists,

    );
  }
}
