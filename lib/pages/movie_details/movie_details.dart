import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie2_application/core/theme/App_assets.dart';
import 'package:movie2_application/core/theme/App_strings.dart';
import 'package:movie2_application/core/theme/color_pallete.dart';
import 'package:movie2_application/customWidget/elevated_button__custom_widget.dart';
import 'package:movie2_application/customWidget/movie_stats_card_widget.dart';
import 'package:movie2_application/customWidget/screen_shots_card_widget.dart';
import 'package:movie2_application/pages/movie_details/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie2_application/pages/movie_details/movie_details_cubit/movie_details_states.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/movie_data_model.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
  }

  MovieData? movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
        builder: (context, state) {
          switch (state) {
            case MovieDetailsInitialState():
              return SizedBox.shrink();
            case MovieDetailsLoadingIState():
              return Center(child: CircularProgressIndicator());
            case MovieDetailsSuccessState():
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.all(16),
                      child: ElevatedButtonCustomWidget(
                        onPressed: () async {
                          try {
                            Uri siteLink = Uri.parse(state.movie.urlLink,);
                            await launchUrl(siteLink,mode: LaunchMode.inAppBrowserView);
                          } catch (e) {
                           Text(e.toString());
                          }
                        },
                        text: AppStrings.watch,
                        backGroundColor: ColorPallete.red,
                        foreGroundColor: ColorPallete.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 20,
                        children: [
                          Expanded(
                            child: MovieStatsCardWidget(
                              svg: SvgPicture.asset(
                                AppAssets.favoriteIcon,
                                width: 28,
                                height: 25,
                              ),
                              statsNumbers: state.movie.likeCount.toString(),
                            ),
                          ),
                          Expanded(
                            child: MovieStatsCardWidget(
                              svg: SvgPicture.asset(
                                AppAssets.clockIcon,
                                width: 28,
                                height: 25,
                              ),
                              statsNumbers: state.movie.runTime.toString(),
                            ),
                          ),
                          Expanded(
                            child: MovieStatsCardWidget(
                              svg: SvgPicture.asset(
                                AppAssets.starIcon,
                                width: 28,
                                height: 25,
                              ),
                              statsNumbers: state.movie.rating.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        AppStrings.screenShots,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          color: ColorPallete.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          final screenshots = [
                            state.movie.largeScreenshotImage1,
                            state.movie.largeScreenshotImage2,
                            state.movie.largeScreenshotImage3,
                          ];

                          return ScreenShotsCardWidget(
                            imagePath: (screenshots.isNotEmpty)
                                ? screenshots[index]
                                : 'https://via.placeholder.com/150',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            case MovieDetailsErrorState():
              return Text(state.errorMessage);
          }
        },
      ),
    );
  }
}
