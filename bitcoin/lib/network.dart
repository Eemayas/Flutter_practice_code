import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  final String url;
  Networkhelper({required this.url});
  Future getData() async {
    var urrl = Uri.parse(url);
    http.Response response = await http.get(urrl);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedata = jsonDecode(data);
      var rate = decodedata['rate'];
      return rate;
    } else {
      print(response.statusCode);
    }
  }
}
