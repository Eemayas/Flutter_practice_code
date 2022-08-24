import 'package:flutter/material.dart';
// import 'package:weather/services/weather.dart';
// import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// // import 'package:weather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();
    // getlocationData();
    // print('initstate');
  }

  // void getlocationData() async {
  //   WeatherModel weatherModel = WeatherModel();
  //   var weatherdata = await weatherModel.getlocationdata();
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return LocationScreen(
  //       locationweather: weatherdata,
  //     );
  //   }));
  // }

  //Future<void> getdata() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
