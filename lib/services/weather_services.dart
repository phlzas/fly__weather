import 'package:dio/dio.dart';
import 'package:fly_weather/models/weather_model.dart';

class WeatherServices {
  static Dio dio = Dio();

  static Future<WeatherModel> getWeather(String location) async {
    try {
      Response response = await dio.get(
          "https://api.weatherstack.com/current?access_key=1f336fa08d8e112b9ffc5011d1084e05&query=${location}");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      print('Error: ${e}');
      rethrow;
    } catch (e) {
      print('Error: e');
      rethrow;
    }
  }
}
