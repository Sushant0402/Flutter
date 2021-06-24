import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';



const apiKey = '78b60b0db8ca25a39892a276c626164b';

class WeatherModel {

  Future<dynamic> getCityLocation(String cityName)async {

    NetworkHelper networkHelper = NetworkHelper(url: Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'));
    //get method take a Uri type data so we have to convert api address into a Uri type using Uri.parse

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(url: Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location
            .latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'));
    //get method take a Uri type data so we have to convert api address into a Uri type using Uri.parse

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
