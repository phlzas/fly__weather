import 'package:dio/dio.dart';
import 'package:fly_weather/models/airports_models.dart';

class AirportsService {
  static Dio dio = Dio();
  static Future<AirportsModels> getAirprts() async {
    try {
      Response response = await dio.get(
          "https://api.aviationstack.com/v1/airports?access_key=e6d7398bfc4a3d196ab13da56d578f3d");
      return AirportsModels.fromJson(response.data["data"]);
    } on DioException catch (e) {
      print('Error: ${e}');
      rethrow;
    } catch (e) {
      print('Error: ${e}');
      rethrow;
    }
  }
}
