import 'network.dart';

String api = '9E9CA68D-4CD1-4BC8-9A25-2EEEF045B133';
// 'FEA90EDE-5E19-414E-B783-8E9106A684BC';
//String api='B6BF6A76-052A-4269-9D51-07700AF73F4D';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final String currency;
  final String crypoto;
  CoinData({required this.crypoto, required this.currency});
  Future data() async {
    Networkhelper networkhelper = await Networkhelper(
        url:
            'https://rest.coinapi.io/v1/exchangerate/$crypoto/$currency?apikey=$api');

    var rate = networkhelper.getData();
    return rate;
  }
}
