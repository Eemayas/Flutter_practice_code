//height and width
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double Total_Height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double Total_Width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//Padding
const double kPaddingDefault = 10;

//textstyle
TextStyle Heading1 =
    GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 40);
TextStyle Heading2 =
    GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20);
TextStyle Heading3 = GoogleFonts.inter(fontSize: 16);

//Imagelocation
List<String> Firstpage_Image = [
  "images/11.jpg",
  "images/12.jpg",
  "images/13.jpg",
  "images/14.jpg",
  "images/15.jpg"
];

//Colorlist
List<Color?> Firstpage_Colors = [
  Colors.red,
  Colors.amber,
  Colors.amberAccent,
  Colors.black,
  Colors.blue,
  Colors.blueAccent,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
];

//categorieslist
class Categories {
  final String Name;
  final String ImgPath;
  final Function() OnTap;

  Categories({required this.OnTap, required this.Name, required this.ImgPath});
}

List<Categories> Cate_List = [
  Categories(
      Name: "Astronomy", ImgPath: "images/Astronomy.jpg", OnTap: (() {})),
  Categories(Name: "Flower", ImgPath: "images/Flower.jpg", OnTap: (() {})),
  Categories(Name: "Cat", ImgPath: "images/Cat.jpg", OnTap: (() {})),
  Categories(Name: "Dog", ImgPath: "images/Dog.jpg", OnTap: (() {})),
  Categories(Name: "Halloween", ImgPath: "images/Dog.jpg", OnTap: (() {})),
  Categories(Name: "API", ImgPath: "images/Dog.jpg", OnTap: (() {})),
];

//Halloween Image address
List<String> Halloween_Image = [
  "images/11.jpg",
  "images/12.jpg",
  "images/13.jpg",
  "images/14.jpg",
  "images/15.jpg"
];
