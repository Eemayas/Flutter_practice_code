import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Profile App",
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ee Ma Yas'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Image.network(
              "https://scontent.fktm6-1.fna.fbcdn.net/v/t39.30808-6/273558917_919733888738897_1818693039106530172_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=chcJDywEVgIAX8gr-gJ&_nc_ht=scontent.fktm6-1.fna&oh=00_AT_XHLyJcUMZ3VC3Hck29XhbNnzGj3TaUxeyxJpUmjQNdA&oe=62C46633",
              height: 250,
              width: 250,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Name:Prashant Manandhar",
            style: TextStyle(
                fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Address:Banepa,Nepal",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Email:prashantmanandhar2002@gmail.com",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Text(
            "Developed by:Eemayas",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ),
  ));
}
