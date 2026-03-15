
import 'package:flutter/material.dart';
import 'package:movie2_application/core/theme/color_pallete.dart';


class GenresMovie extends StatelessWidget {

  final List<String> genres;

  const GenresMovie({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Genres",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ColorPallete.white,
            ),
          ),

          SizedBox(height: 11),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: genres.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {

              return Container(alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorPallete.gray,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  genres[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorPallete.white,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}