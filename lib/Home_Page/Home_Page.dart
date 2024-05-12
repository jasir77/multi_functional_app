import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Login_Page/Login_Page.dart';
import '../Movie_Information_Page/Movie_Information_Page.dart';
import '../News_Updates_Page/News_Updates_Page.dart';
import '../Timezone_Data_Page/Timezone_Data_Page.dart';
import '../Weather_Forecasts_Page/Weather_Forecasts_Page.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets. symmetric(horizontal: 130),
                  child: ListTile(
                    title: Text(
                      'API',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                      'Weather',
                      CupertinoIcons.wind_snow,
                      Colors.indigo,
                          () => Get.to(Weather_page())),
                  itemDashboard(
                      'News',
                      CupertinoIcons.news,
                      Colors.green,
                          () => Get.to( NewsSearchPage())),
                  itemDashboard(
                      'Movie',
                      CupertinoIcons.play_rectangle,
                      Colors.deepOrange,
                          () => Get.to(MoviePage())),
                  itemDashboard(
                      'Timezone',
                      CupertinoIcons.time_solid,
                      Colors.purple,
                          () => Get.to( Timezone_Page())),

                  itemDashboard(
                      'Login',
                      CupertinoIcons.lock_shield_fill,
                      Colors.red,
                          () => Get.to(LoginPage())),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background, Function()? onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                title.toUpperCase(),
              ),
            ],
          ),
        ),
      );
}
