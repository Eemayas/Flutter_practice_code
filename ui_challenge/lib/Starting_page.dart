import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge/Api_page.dart';
import 'package:ui_challenge/Component/AnimatedNavigator.dart';
import 'package:ui_challenge/Constant/Constant.dart';
import 'package:ui_challenge/Halloween.dart';

class Starting_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
              height: Total_Height(context),
              width: Total_Width(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/Background_image.jpg"),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBar(textEditingController: _textEditingController),
                    Textt(
                      Texttt: "Best of the Month",
                    ),
                    ListTile_BestMonth(),
                    Textt(
                      Texttt: "Theme",
                    ),
                    ListTile_Theme(),
                    Textt(
                      Texttt: "Categories",
                    ),
                    GridView_Categories(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class ListTile_Theme extends StatelessWidget {
  const ListTile_Theme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Firstpage_Colors.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
            child: Container(
              height: 45,
              width: 45,
              // color: Colors.black,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Firstpage_Colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListTile_BestMonth extends StatelessWidget {
  const ListTile_BestMonth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPaddingDefault),
      child: Container(
        height: Total_Height(context) * 0.24,
        child: ListView.builder(
          itemCount: Firstpage_Image.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
              child: Container(
                width: Total_Width(context) * 0.27,
                height: Total_Height(context) * 0.27,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(Firstpage_Image[index]),
                      fit: BoxFit.fill,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GridView_Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = 80;
    double width = Total_Width(context) * 0.4;
    return Expanded(
      // height: height,
      // width: width,
      child: GridView.builder(
        itemCount: Cate_List.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 100,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          //return Text("sdvs");
          return GridTile_Categories(
            height: height,
            width: width,
            index: index,
          );
        },
      ),
    );
  }
}

class GridTile_Categories extends StatelessWidget {
  final double height;
  final double width;
  final int index;

  GridTile_Categories(
      {required this.height, required this.width, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Cate_List[index].Name == "Halloween") {
          // Navigator.push(contexst,
          //     MaterialPageRoute(builder: (builder) => Halloween_Page()));
          Navigator.push(context, CustomPageNavigator(Child: Halloween_Page()));
        }
        if (Cate_List[index].Name == "Api".toUpperCase()) {
          // Navigator.push(contexst,
          //     MaterialPageRoute(builder: (builder) => Halloween_Page()));
          Navigator.push(context, CustomPageNavigator(Child: Apipage()));
        }
      },
      child: Container(
        // height: 80,
        width: Total_Width(context) * 0.45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(Cate_List[index].ImgPath), fit: BoxFit.fill)),
        child: Stack(
          children: [
            Container(
                // height: 80,
                // width: Total_Width(context) * 0.45,
                decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(20),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: kPaddingDefault * 1.5),
                child: Text(
                  Cate_List[index].Name,
                  style: Heading2.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Textt extends StatelessWidget {
  final String Texttt;

  Textt({required this.Texttt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: kPaddingDefault * 3, bottom: kPaddingDefault),
      child: Text(
        Texttt,
        style: Heading2,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required TextEditingController textEditingController,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
        helpText: "Search for Best Wallpaper",
        rtl: true,
        width: Total_Width(context),
        textController: _textEditingController,
        onSuffixTap: () {
          _textEditingController.clear();
        });
  }
}
