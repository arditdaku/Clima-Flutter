import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apiKey = 'b17add8c4d256bf974f20bdbd22853ed';
const openWeatherMapUrl ='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url='$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }


  Future<dynamic> getLocationWeather() async{
    Localtion localtion = Localtion();
    await localtion.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${localtion.latitude}&lon=${localtion.longitude}&appid=$apiKey&units=metric');
    //sending data to api

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
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
