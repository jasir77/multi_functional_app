import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Home_Page/Binding/Home_Binding.dart';
import '../Home_Page/Home_Page.dart';
import '../Login_Page/Binding/Login_Binding.dart';
import '../Login_Page/Login_Page.dart';
import '../Movie_Information_Page/Binding/Movie_Information_Binding.dart';
import '../Movie_Information_Page/Movie_Information_Page.dart';
import '../News_Updates_Page/Binding/News_Updates_Binding.dart';
import '../News_Updates_Page/News_Updates_Page.dart';
import '../Splash_Screen/Binding/Splash_Binding.dart';
import '../Splash_Screen/Splash_Page.dart';
import '../Timezone_Data_Page/Binding/Timezone_Binding.dart';
import '../Timezone_Data_Page/Timezone_Data_Page.dart';
import '../Weather_Forecasts_Page/Binding/Weather_Forecasts_Binding.dart';
import '../Weather_Forecasts_Page/Weather_Forecasts_Page.dart';
import 'App_Routes.dart';

class AppPages {
  static var Lists = [
    GetPage(
      name: AppRoutes.splash,
      page: () => Splash(),
      binding: Splashbinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () =>  Home_Page(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes. weather,
      page: () => Weather_page(),
      binding:  WeatherBinding (),
    ),
    GetPage(
    name: AppRoutes. timezone,
  page: () => TimeZoneSearch(),
  binding: TimezoneBinding (),
    ),
    GetPage(
      name: AppRoutes. movie,
      page: () => MoviePage(),
      binding: MovieBinding (),
    ),
    GetPage(
      name: AppRoutes. news,
      page: () =>  NewsScreen(),
      binding:  NewsBinding (),
    ),
    GetPage(
      name: AppRoutes. login,
      page: () => LoginPage(),
      binding:  loginBinding(),
    ),

    ];
}