import 'package:http/http.dart' as http;
import 'dart:convert';

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

<<<<<<< HEAD
const bitcoinAverageURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';
=======
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'YOUR-API-KEY-HERE';
>>>>>>> 49d7f584bd935289b12babeff24c3074da1fc8be

class CoinData {

  Future<List<double>> getCoinData(String currency) async {
    List<double> price = [];

    // Get response from API
    for (int i = 0; i < cryptoList.length; i++) {
      String httpURL = bitcoinAverageURL + '/' + cryptoList[i] + currency;
      http.Response response = await http.get(httpURL);
      if (response.statusCode == 200) {
        // Save response in string and decode
        String data = response.body;
        var decodedData = jsonDecode(data);
        // Get last price
        price.add(decodedData['last']);
      }
    }
    return price;
  }
}
