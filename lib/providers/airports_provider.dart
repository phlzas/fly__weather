import 'package:flutter/material.dart';
import 'package:fly_weather/Request_state.dart';
import 'package:fly_weather/models/airports_models.dart';
import 'package:fly_weather/services/airports_service.dart';

class AirportsProvider extends ChangeNotifier {
  AirportsModels? airports;
  RequestState state = RequestState.idle;

  Future<void> get() async {
    try {
      state = RequestState.loading;
      notifyListeners();
      final response = await AirportsService.getAirprts();
      airports = response;
      if (airports == null) {
        state = RequestState.empty;
      } else {
        state = RequestState.success;
      }
      notifyListeners();
    } catch (e) {
      state = RequestState.error;
      notifyListeners();
      print('Error: ${e.toString()}');
      rethrow;
    }
  }
}
