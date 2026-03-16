import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fly_weather/Request_state.dart';
import 'package:fly_weather/models/airports_models.dart';
import 'package:fly_weather/models/user_models.dart';
import 'package:fly_weather/services/auth_service.dart';

class AuthProivders extends ChangeNotifier {
  RequestState state = RequestState.idle;

  UserModels? user;

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      state = RequestState.loading;
      final response =
          await AuthService.login(email: email, password: password);
      user = response;
      if (user == null) {
        state = RequestState.empty;
      } else {
        state = RequestState.success;
      }
    } catch (e) {
      state = RequestState.error;
      print('Error: ${e.toString()}');
      rethrow;
    }
  }

  Future signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      state = RequestState.loading;
      final response = await AuthService.signup(
          email: email, password: password, name: name);
      user = response;
      if (user == null) {
        state = RequestState.empty;
      } else {
        state = RequestState.success;
      }
    } catch (e) {
      state = RequestState.error;
      print('Error: ${e.toString()}');
      rethrow;
    }
  }
}
