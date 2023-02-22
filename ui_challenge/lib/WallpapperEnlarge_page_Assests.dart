import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'Component/GlassEffect.dart';
import 'Constant/Constant.dart';

class Wallpaper_Enlarge_Page_Assest extends StatelessWidget {
  final String ImgPath;

  const Wallpaper_Enlarge_Page_Assest({required this.ImgPath});

  @override
  Widget build(BuildContext context) {
    //return GlassMorphism();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(ImgPath), fit: BoxFit.cover)),
        child: SafeArea(
          child: FostedGlassEffect(
            ImgPath: ImgPath,
            height: Total_Height(context),
            width: Total_Width(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImagePreviewAssest(ImgPath: ImgPath),
                Buttons(
                  data: "Set as Homescreen",
                  OnTAp: () async {
                    // String assetPath = ImgPath;
                    // int location = WallpaperManager
                    //     .HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;

                    // final String result =
                    //     await WallpaperManager.setWallpaperFromAsset(
                    //         assetPath, location);
                    print("pressed");
                  },
                ),
                Buttons(data: "Set as Lockscreen"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final Function()? OnTAp;
  const Buttons({
    Key? key,
    required this.data,
    this.OnTAp,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTAp,
      child: Container(
        height: 40,
        width: Total_Width(context) * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0X4D000000)),
        child: Center(
          child: Text(
            data,
            style: Heading3.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ImagePreviewAssest extends StatelessWidget {
  const ImagePreviewAssest({
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
        image: DecorationImage(image: AssetImage(ImgPath), fit: BoxFit.cover),
      ),
    );
  }
}
