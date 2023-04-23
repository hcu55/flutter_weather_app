import 'package:geolocator/geolocator.dart';

class MyLocation{
  double? latitude2;
  double? longitude2;

  Future<void> getMyCurrentLocaton() async{
    try {
      // LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    }
    catch(e){
      print('인터넷 문제가 발생하였습니다.');
    }
  }
}
