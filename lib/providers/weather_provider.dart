import 'package:flutter/material.dart';
import 'package:fly_weather/Request_state.dart';
import 'package:fly_weather/models/weather_model.dart';
import 'package:fly_weather/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  RequestState state = RequestState.idle;
  WeatherModel? weather;

  Future get(String location) async {
    try {
      state = RequestState.loading;
      notifyListeners();
      final response = await WeatherServices.getWeather(location);
      weather = response;
      if (weather == null) {
        state = RequestState.empty;
      } else {
        state = RequestState.success;
      }
      notifyListeners();
    } catch (e) {
      print('Error: e');
      rethrow;
    }
  }
}
