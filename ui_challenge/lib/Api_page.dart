import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'Component/AnimatedNavigator.dart';
import 'Constant/Api.dart';
import 'Constant/Constant.dart';

import 'WallpapperEnlarge_page_Assests.dart';
import 'WallpapperEnlarge_page_Network.dart';

class Apipage extends StatefulWidget {
  const Apipage({super.key});

  @override
  State<Apipage> createState() => _ApipageState();
}

class _ApipageState extends State<Apipage> {
  late Future<List> futureAlbum;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  // }
  void iniiiii() {
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    iniiiii();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kPaddingDefault * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FirstText(),
              SizedBox(
                height: kPaddingDefault * 2,
              ),
              FutureApiGridView(futureAlbum: futureAlbum),
            ],
          ),
        ),
      ),
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
      "API ",
      style: Heading1,
    );
  }
}

class FutureApiGridView extends StatelessWidget {
  const FutureApiGridView({
    Key? key,
    required this.futureAlbum,
  }) : super(key: key);

  final Future<List> futureAlbum;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: MasonryGridView.count(
              itemCount: snapshot.data!.length,
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      CustomPageNavigator(
                          Child: Wallpaper_Enlarge_Page_Network(
                        ImgPath: snapshot.data![index].FullImg,
                      ))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: NetworkImage(snapshot.data![index].FullImg),
                        fit: BoxFit.fitHeight,
                      )),
                );
              },
            ),
          );
          // return Column(
          //   children: [
          //     for (int i = 0; i < snapshot.data!.length; i++)
          //       Column(
          //         children: [
          //           Text(snapshot.data![i].id),
          //           Text(snapshot.data![i].FullImg),
          //         ],
          //       ),
          //   ],
          // );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
