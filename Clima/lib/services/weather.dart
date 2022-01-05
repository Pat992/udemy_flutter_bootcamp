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
      return '🌩';
    } else if (condition == 1183) {
      return '🌧';
    } else if (condition == 1186 || condition == 1189) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition == 1030) {
      return '🌫';
    } else if (condition == 1000) {
      return '☀️';
    } else if (condition == 1063 || condition == 1153 || condition == 1180) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
