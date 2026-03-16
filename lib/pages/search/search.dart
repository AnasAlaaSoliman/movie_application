import 'package:flutter/material.dart';
import 'package:movie2_application/pages/home_screen/widget_home/movie_card.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/theme/image_repository.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: TextField(
            style: TextStyle(color: ColorPallete.white,fontSize: 16),
            decoration: InputDecoration(
              prefixIcon:Image.asset(
                "assets/icons/searchIcon.png",
              ),
              filled: true,
              fillColor: ColorPallete.gray,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: ImageRepository.historyImage.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return MovieCard( imagePath: ImageRepository.historyImage[index],movieId: 7,rating: 4,);
          },
        ),
      ),
    );
  }
}
