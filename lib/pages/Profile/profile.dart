import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/cubit/historyCubit.dart';
import 'package:movie2_application/models/movie_details_model.dart';
import 'package:movie2_application/pages/Profile/update_profile_page.dart';
import 'package:movie2_application/pages/home_screen/widget_home/movie_card.dart';
import '../../core/theme/App_assets.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/theme/image_repository.dart';
import '../../cubit/watchListCubit.dart';
import '../../customWidget/custom_button.dart';
import '../../models/movie_model.dart';
import '../auth_screens/login/login_screen.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = "John Safwat";

  String wishListNo = "12";

  String historyNo = "10";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorPallete.gray,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.46),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorPallete.gray,
            elevation: 0,

            flexibleSpace: SafeArea(
              child: SingleChildScrollView(child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                child: Image.asset(AppAssets.player1),
                              ),

                              SizedBox(height: 15),

                              Text(
                                userName,
                                style: TextStyle(
                                  color: ColorPallete.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(

                            children: [
                              BlocBuilder<
                                WatchListCubit,
                                List<MovieDetailsModel>
                              >(
                                builder: (context, movies) {
                                  return Text(
                                    movies.length.toString(),
                                    style: TextStyle(
                                      color: ColorPallete.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  );
                                },
                              ),
                              Text(
                                "Wish List",
                                style: TextStyle(
                                  color: ColorPallete.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              BlocBuilder<Historycubit,List<MovieDetailsModel>>(
                                builder: (context, movies) {
                                  return Text(
                                    movies.length.toString(),
                                    style: TextStyle(
                                      color: ColorPallete.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  );
                                },
                              ),
                              Text(
                                "History",
                                style: TextStyle(
                                  color: ColorPallete.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateProfilePage(),
                                ),
                              );
                            },
                            text: "Edit Profile",
                            textColor: ColorPallete.black,
                            buttonColor: ColorPallete.yellow,
                          ),
                        ),

                        SizedBox(height: 15),

                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            text: "Exit",
                            textColor: ColorPallete.white,
                            buttonColor: ColorPallete.red,
                            suffix: Icons.exit_to_app,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ),


            bottom: TabBar(
              labelStyle: TextStyle(
                color: ColorPallete.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              labelColor: ColorPallete.white,
              dividerColor: Colors.transparent,
              indicatorColor: ColorPallete.yellow,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  height: 85,
                  text: "Watch List",
                  icon: Image.asset('assets/images/Group 20.png', scale: 2.5),
                ),
                Tab(
                  height: 85,
                  text: "History",
                  icon: Image.asset('assets/images/folderIcon.png', scale: 2.5),
                ),
              ],
            ),
          ),
        ),

        body: TabBarView(
          children: [
            BlocBuilder<WatchListCubit, List<MovieDetailsModel>>(
              builder: (context, movies) {
                if (movies.isEmpty) {
                  return Image.asset("assets/images/empty.png");
                }

                return Container(
                  color: ColorPallete.black,
                  child: GridView.builder(
                    itemCount: movies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.5,
                    ),
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8.0,
                        ),
                        child: MovieCard(
                          imagePath: movie.poster,
                          movieId: movie.id,
                          rating: movie.rating,
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            BlocBuilder<Historycubit, List<MovieDetailsModel>>(
              builder: (context, movies) {
                if (movies.isEmpty) {
                  return Image.asset("assets/images/empty.png");
                }
                return Container(
                  color: ColorPallete.black,
                  child: GridView.builder(
                    itemCount: movies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MovieCard(
                          imagePath: movie.poster,
                          movieId: movie.id,
                          rating: movie.rating,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
