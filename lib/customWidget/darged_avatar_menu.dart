import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../core/theme/color_pallete.dart';
import '../core/theme/image_repository.dart';

class DargedAvatarMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 450,
      decoration: BoxDecoration(
        color: ColorPallete.gray,
        borderRadius: BorderRadius.circular(18),
      ),
      child: GridView.builder(
        itemCount: ImageRepository.avatars.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
        ),

        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                border: BoxBorder.all(color: ColorPallete.yellow, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Bounceable(
                  onTap: () {Navigator.pop(context,index);},
                  child: Image.asset(ImageRepository.avatars[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
