import 'package:flutter/material.dart';
import 'package:movie2_application/pages/home_screen/Home_tab_screen.dart';import '../../core/theme/App_assets.dart';
import '../../core/theme/color_pallete.dart';

import '../Profile/profile.dart';
import '../explore/explore.dart';
import '../search/search.dart';

/*class NavigationbarScreen extends StatefulWidget {
  @override
  State<NavigationbarScreen> createState() => _HomeScreenStateScreen();
}

class _HomeScreenStateScreen extends State<NavigationbarScreen> {
  int current_index = 0;


  List screens=[HomeTabScreen(),Search(),Explore(),Profile()];

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
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/cubit/movie_cubit.dart';
import 'package:movie2_application/cubit/movie_details_state.dart';
import 'package:movie2_application/cubit/movie_state.dart' hide MovieCubit;
import 'package:movie2_application/models/movie_model.dart';
import 'package:movie2_application/pages/home_screen/Home_tab_screen.dart';
import '../../core/theme/App_assets.dart';
import '../../core/theme/color_pallete.dart';

import '../../cubit/movie_details_cubit.dart';
import '../../models/movie_details_model.dart';
import '../Profile/profile.dart';
import '../explore/explore.dart';
import '../search/search.dart';

class NavigationbarScreen extends StatefulWidget {
  @override
  State<NavigationbarScreen> createState() => _HomeScreenStateScreen();
}

class _HomeScreenStateScreen extends State<NavigationbarScreen> {
  int current_index = 0;

  // List screens = [HomeTabScreen(), Search(), Explore(), Profile()];

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
                //var cubit = context.read<MovieCubit>();
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
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieInitial) {
            return SizedBox.shrink();
          }
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieSuccess) {
            return [
              HomeTabScreen(),
              Search(),
              Explore(),
              Profile(),
            ][current_index];
          }
          if (state is MovieError) {
            return Text(state.message);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
