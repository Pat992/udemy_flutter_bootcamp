import 'package:geolocator/geolocator.dart';

class Location{

  double _latitude;
  double _longitude;

  Future<void> getCurrentLocation() async{
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude = position.latitude;
      _longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }

  double getLatitude(){
    return this._latitude;
  }

  double getLongitude(){
    return this._longitude;
  }
}
