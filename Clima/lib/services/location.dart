import 'package:geolocator/geolocator.dart';

//In this file we are fetching location using the geolocator flutter package
class Location {
  double latitude =0 ;
  double longitude = 0;

  Future<void> getCurrentLocation() async{  //whenever we use async function the returning type will be of future
    //future means that value is currently no clear and will be clear in future, we can sue <> to make in specific from generic
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //Geolocator return Position type data
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}