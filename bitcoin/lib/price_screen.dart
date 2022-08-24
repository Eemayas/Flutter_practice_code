import 'package:bitcoin/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

String selectedcrypto = 'BTC';
String Selectedcurrency = 'USD';
String bitcoinValueInAnyCurrency = '?';
String bitcoinValueInAnyCurrency1 = '?';
String bitcoinValueInAnyCurrency2 = '?';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DropdownButton<String> andrioddropdown() {
    List<DropdownMenuItem<String>> dropdownitem = [];
    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitem.add(item);
    }
    return DropdownButton<String>(
      value: Selectedcurrency,
      items: dropdownitem,
      onChanged: (value) {
        setState(() {
          Selectedcurrency = value!;
        });
      },
    );
  }

  CupertinoPicker iOSpicker() {
    List<Text> cupplist = [];
    for (String currency in currenciesList) {
      cupplist.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedindex) {
        print(selectedindex);
      },
      children: cupplist,
    );
  }

  // //11. Create an async method here await the coin data from coin_data.dart
  // void getData(String cccc, String curr) async {
  //   print('kkkkkk2');
  //   try {
  //     double data = await CoinData(currency: curr, crypoto: cccc).data();
  //     //13. We can't await in a setState(). So you have to separate it out into two steps.
  //     setState(() {
  //       bitcoinValueInAnyCurrency = data.toStringAsFixed(0);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // String BtoU = 'hvhv';
  Map<String, Future<String>> coindataa = {};
  Future<String> getdata(String curr) async {
    try {
      CoinData coinData = CoinData(currency: curr, crypoto: 'BTC');
      double data = await CoinData(currency: curr, crypoto: 'BTC').data();
      double data1 = await CoinData(currency: curr, crypoto: 'ETH').data();
      double data2 = await CoinData(currency: curr, crypoto: 'LTC').data();
      setState(() {
        bitcoinValueInAnyCurrency = data.toString();
        bitcoinValueInAnyCurrency1 = data1.toString();
        bitcoinValueInAnyCurrency2 = data2.toString();
      });
    } catch (e) {
      print(e);
    }
    return bitcoinValueInAnyCurrency;
  }

  // void dataequal() async {
  //   coindataa['BTC'] = getdata('BTC', Selectedcurrency);
  //   coindataa['ETH'] = getdata('ETH', Selectedcurrency);
  //   coindataa['LTC'] = getdata('LTC', Selectedcurrency);
  // }

  @override
  Widget build(BuildContext context) {
    // getdata('BTC', Selectedcurrency);
    getdata(Selectedcurrency);

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              detail(
                  crypto: cryptoList[0],
                  bitcoinValueInAnyCurrency: bitcoinValueInAnyCurrency,
                  Selectedcurrency: Selectedcurrency),
              detail(
                  crypto: cryptoList[1],
                  bitcoinValueInAnyCurrency: bitcoinValueInAnyCurrency1,
                  Selectedcurrency: Selectedcurrency),
              detail(
                  crypto: cryptoList[2],
                  bitcoinValueInAnyCurrency: bitcoinValueInAnyCurrency2,
                  Selectedcurrency: Selectedcurrency),
            ],
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? iOSpicker() : andrioddropdown()),
        ],
      ),
    );
  }
}

class detail extends StatelessWidget {
  const detail({
    Key? key,
    required this.bitcoinValueInAnyCurrency,
    required this.Selectedcurrency,
    required this.crypto,
  }) : super(key: key);

  final String bitcoinValueInAnyCurrency;
  final String Selectedcurrency;
  final String crypto;
  void findingcrytpo() {
    selectedcrypto = crypto;
  }

  @override
  Widget build(BuildContext context) {
    findingcrytpo();
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $bitcoinValueInAnyCurrency $Selectedcurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}




  // List<String> cuplist() {
  //   List<String> cupplist = [];
  //   for (String currency in currenciesList) {
  //     String item = Text(currency)
  //     cupplist.add(item);
  //   }
  //   return cupplist;
  // }
  