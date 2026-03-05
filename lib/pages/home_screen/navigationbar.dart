import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/App_assets.dart';
import 'package:movie_app/core/theme/color_pallete.dart';
import 'package:movie_app/pages/Profile/profile.dart';
import 'package:movie_app/pages/explore/explore.dart';
import 'package:movie_app/pages/home_screen/home.dart';
import 'package:movie_app/pages/search/search.dart';

class NavigationbarScreen extends StatefulWidget {
  @override
  State<NavigationbarScreen> createState() => _HomeScreenStateScreen();
}

class _HomeScreenStateScreen extends State<NavigationbarScreen> {
  int current_index = 0;


  List screens=[Home(),Search(),Explore(),Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            currentIndex: current_index,
            onTap: (x) {
              setState(() {
                current_index = x;
              });
            },

            backgroundColor: ColorPallete.gray,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,

            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.home_icon_Inactive,
                  height: 26,
                  width: 26,
                ),
                label: '',
                activeIcon: Image.asset(
                  AppAssets.home_icon_active,
                  height: 26,
                  width: 26,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.search_icon_Inactive,
                  height: 26,
                  width: 26,
                ),
                label: '',
                activeIcon: Image.asset(
                  AppAssets.search_icon_active,
                  height: 26,
                  width: 26,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.explore_icon_Inactive,
                  height: 26,
                  width: 26,
                ),
                label: '',
                activeIcon: Image.asset(
                  AppAssets.explore_icon_active,
                  height: 26,
                  width: 26,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.profile_icon_Inactive,
                  height: 26,
                  width: 26,
                ),
                label: '',
                activeIcon: Image.asset(
                  AppAssets.profile_icon_active,
                  height: 26,
                  width: 26,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens[current_index],
    );
  }
}
