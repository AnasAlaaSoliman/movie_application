import 'package:flutter/material.dart';
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
}
