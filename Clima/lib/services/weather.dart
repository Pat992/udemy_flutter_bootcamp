import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {


  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper('https://api.apixu.com/v1/current.json?key=6080ed87d4434bda815163028191907&q=${location.getLatitude()},${location.getLongitude()}');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async{
    var url = ('https://api.apixu.com/v1/current.json?key=6080ed87d4434bda815163028191907&q=$cityName');
    NetworkHelper networkHelper = new NetworkHelper(url);

    var weatherData = networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 1087) {
      return '๐ฉ';
    } else if (condition == 1183) {
      return '๐ง';
    } else if (condition == 1186 || condition == 1189) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition == 1030) {
      return '๐ซ';
    } else if (condition == 1000) {
      return 'โ๏ธ';
    } else if (condition == 1063 || condition == 1153 || condition == 1180) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
