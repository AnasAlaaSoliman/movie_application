import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/App_assets.dart';
import '../../core/theme/App_strings.dart';
import '../../core/theme/color_pallete.dart';
import '../../customWidget/elevated_button__custom_widget.dart';
import '../../customWidget/movie_stats_card_widget.dart';
import '../../customWidget/screen_shots_card_widget.dart';
import '../../models/movie_details_model.dart';

class MovieDetailsUI extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieDetailsUI({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenshots = [
      movie.largeScreenshotImage1,
      movie.largeScreenshotImage2,
      movie.largeScreenshotImage3,
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // زر WATCH
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButtonCustomWidget(
              text: AppStrings.watch,
              backGroundColor: ColorPallete.red,
              foreGroundColor: ColorPallete.white,
              onPressed: () async {
                try {
                  Uri siteLink = Uri.parse(movie.urlLink);
                  await launchUrl(
                    siteLink,
                    mode: LaunchMode.inAppWebView, // بدل inAppBrowser
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          ),

          // Stats: Likes, Runtime, Rating
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: MovieStatsCardWidget(
                    svg: SvgPicture.asset(
                      AppAssets.favoriteIcon,
                      width: 28,
                      height: 25,
                    ),
                    statsNumbers: movie.likeCount.toString(),
                  ),
                ),
                Expanded(
                  child: MovieStatsCardWidget(
                    svg: SvgPicture.asset(
                      AppAssets.clockIcon,
                      width: 28,
                      height: 25,
                    ),
                    statsNumbers: movie.runTime.toString(),
                  ),
                ),
                Expanded(
                  child: MovieStatsCardWidget(
                    svg: SvgPicture.asset(
                      AppAssets.starIcon,
                      width: 28,
                      height: 25,
                    ),
                    statsNumbers: movie.rating.toString(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Screenshots
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              AppStrings.screenShots,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
                color: ColorPallete.white,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: screenshots.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScreenShotsCardWidget(
                    imagePath: screenshots[index].isNotEmpty
                        ? screenshots[index]
                        : 'https://via.placeholder.com/150',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}