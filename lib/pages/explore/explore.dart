/*import 'package:flutter/material.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/theme/image_repository.dart';
import '../home_screen/widget_home/movie_card.dart';

class Explore extends StatelessWidget {
  List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "egyptian",
    "americans",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: ColorPallete.black,

        appBar: AppBar(
          backgroundColor: ColorPallete.black,
          automaticallyImplyLeading: false,

          bottom: TabBar(
            dividerColor: Colors.transparent,
            isScrollable: true,
            indicatorColor: ColorPallete.yellow,
            labelColor: ColorPallete.black,
            unselectedLabelColor: ColorPallete.yellow,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: ColorPallete.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            tabs: categories
                .map(
                  (e) => Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      child: Text(
                        e,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),

        body: TabBarView(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: ImageRepository.historyImage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return MovieCard(
                    imagePath: ImageRepository.historyImage[index],
                    movieId: 7,
                    rating: 4,
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/theme/image_repository.dart';
import '../../cubit/movie_cubit.dart';
import '../home_screen/widget_home/movie_card.dart';

class Explore extends StatelessWidget {

  Explore({super.key});

  // final List<String> categories = [
  //   "Drama",
  //   "Adventure",
  //   "Animation",
  //   "Biography",
  //   "Horror",
  //   "Action",
  //   "Comedy",
  //   "Crime",
  //   "History",
  //   "Egyptian",
  //   "Thriller",
  //   "Music",
  //   "Romance",
  //   "Family",
  //   "Americans",
  // ];

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

    final cubit = context.watch<MovieCubit>();
    final categories = cubit.categories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: ColorPallete.black,

        appBar: AppBar(
          backgroundColor: ColorPallete.black,
          automaticallyImplyLeading: false,

          bottom: TabBar(
            dividerColor: Colors.transparent,
            isScrollable: true,
            indicatorColor: ColorPallete.yellow,
            labelColor: ColorPallete.black,
            unselectedLabelColor: ColorPallete.yellow,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: ColorPallete.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            tabs: categories
                .map(
                  (e) => Tab(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  child: Text(
                    e,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ),

        body: TabBarView(
          children: categories.map((category) {
            final movies = cubit.getMoviesByCategory(category);
            if (movies.isEmpty) {
              return Center(
                child: Text("No movies", style: TextStyle(color: Colors.white)),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieCard(
                    imagePath: movie.mediumCoverImage,
                    rating: movie.rating,
                    movieId: movie.id,
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

