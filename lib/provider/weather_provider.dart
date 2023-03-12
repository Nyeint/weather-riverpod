import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/model/forecast_model.dart';
import 'package:weather/network/api/weather_api.dart';
import 'package:weather/network/repository/weather_repository.dart';
import '../model/weather_model.dart';
import '../service_locator.dart';


final latProvider = StateProvider<String?>(
      (ref) => "22.1216",
);

final lonProvider = StateProvider<String?>(
      (ref) => "95.1536",
);

final weatherApiProvider = Provider<WeatherApi>((ref) => getIt<WeatherApi>());

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository(ref.read(weatherApiProvider));
});

final currentWeatherProvider = FutureProvider<WeatherModel>((ref) {
  final lat=ref.watch(latProvider);
  final lon=ref.watch(lonProvider);
  return ref.read(weatherRepositoryProvider).getCurrentWeather(lat: lat.toString(), lon: lon.toString());
});

final forecastWeatherProvider = FutureProvider<ForecastModel>((ref) {
  final lat=ref.watch(latProvider);
  final lon=ref.watch(lonProvider);
  return ref.read(weatherRepositoryProvider).getForecastWeather(lat: lat.toString(), lon: lon.toString());
});

// get location
class LocationHelper extends ChangeNotifier {
  late Position position;
  LocationHelper() {
    getLocation();
  }
  Future getLocation() async{
    try{
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude,localeIdentifier: "en");

      Placemark place = placemarks[0];
      String address=place.locality.toString()+', '+place.country.toString();
      return {'latitude':position.latitude,'longitude':position.longitude,'address':address};
    }
    catch(e){
      Future.error("Something wrong");
    }
  }
}

final locationProvider = Provider<LocationHelper>((ref) {
  return LocationHelper();
});

final myLocationStream = FutureProvider.autoDispose(
      (ref) {
    return ref.read(locationProvider).getLocation();
  },
);

