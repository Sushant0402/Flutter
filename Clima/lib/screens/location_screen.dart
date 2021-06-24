import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';


//This is the fisrt page of our app in this we are showing the fetched data that has been passes through
//loading screen file and also we can reload
class LocationScreen extends StatefulWidget {

  final weatherData;
  LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();

}

class _LocationScreenState extends State<LocationScreen> {
  //This class extends a state and a state object knows which stateful widget it belongs to
  //so if you want to contact to that stateful widget which this state belongs, you can do it via "widget" property

  late int temperature; //late means it will be initialized later
  late String weatherIcon;
  late String city;
  late String weatherMessage;
  final WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temperature = 0;
        weatherIcon = "";
        city="Unknown";
        weatherMessage="Couldn't find your location, switch On your Location.";
        return;
      }
      temperature = weatherData['main']['temp'].toInt();
      city = weatherData['name'];
      weatherIcon = weatherModel.getWeatherIcon(weatherData['weather'][0]['id']); //first fetching id from json and getting icon on basis of it
      weatherMessage = weatherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async{
                        var weatherData = await weatherModel.getLocationWeather();
                        //we can only pass weatherData to updateUI when weatherModel fetch the data so await
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.my_location,
                        size: 50.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CityScreen();
                        }));
                        //Navigator can return data so we are getting city name from City page and calling city weather
                        //api to fetch data and then updating UI

                        if(cityName != null){
                          var weatherData = await weatherModel.getCityLocation(cityName);
                          updateUI(weatherData);
                        }
                      },
                      child: Icon(
                        Icons.search,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$temperature℃',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "$weatherMessage in $city.",
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

