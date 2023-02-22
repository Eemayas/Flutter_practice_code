import 'package:flutter/material.dart';

import 'Component/GlassEffect.dart';
import 'Constant/Constant.dart';
import 'WallpapperEnlarge_page_Assests.dart';

class Wallpaper_Enlarge_Page_Network extends StatelessWidget {
  final String ImgPath;

  Wallpaper_Enlarge_Page_Network({required this.ImgPath});

  @override
  Widget build(BuildContext context) {
    //return GlassMorphism();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(ImgPath), fit: BoxFit.cover)),
        child: FostedGlassEffectNetwork(
          ImgPath: ImgPath,
          height: Total_Height(context),
          width: Total_Width(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImagePreviewNewtork(ImgPath: ImgPath),
              Buttons(data: "Set as Homescreen"),
              Buttons(data: "Set as Lockscreen"),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagePreviewNewtork extends StatelessWidget {
  const ImagePreviewNewtork({
    Key? key,
    required this.ImgPath,
  }) : super(key: key);

  final String ImgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Total_Height(context) * 0.6,
      width: Total_Width(context) * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(image: NetworkImage(ImgPath), fit: BoxFit.cover),
      ),
    );
  }
}
