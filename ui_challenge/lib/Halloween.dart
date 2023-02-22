import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui_challenge/Component/AnimatedNavigator.dart';
import 'package:ui_challenge/WallpapperEnlarge_page_Assests.dart';

import 'Constant/Constant.dart';

class Halloween_Page extends StatelessWidget {
  const Halloween_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Total_Height(context),
        width: Total_Width(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Background_image.jpg"),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(kPaddingDefault * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FirstText(),
                SecondText(),
                SizedBox(
                  height: kPaddingDefault * 2,
                ),
                GridViewWallpapper(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridViewWallpapper extends StatelessWidget {
  const GridViewWallpapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.count(
        itemCount: Halloween_Image.length,
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                CustomPageNavigator(
                    Child: Wallpaper_Enlarge_Page_Assest(
                  ImgPath: Halloween_Image[index],
                ))),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: AssetImage(Halloween_Image[index]),
                  fit: BoxFit.fitHeight,
                )),
          );
        },
      ),
    );
  }
}

class SecondText extends StatelessWidget {
  const SecondText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${Halloween_Image.length} Wallpapper availabel",
      style: Heading3,
    );
  }
}

class FirstText extends StatelessWidget {
  const FirstText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Halloween",
      style: Heading1,
    );
  }
}
