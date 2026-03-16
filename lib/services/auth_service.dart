import 'package:dio/dio.dart';
import 'package:fly_weather/models/user_models.dart';

class AuthService {
  static Dio dio = Dio();

  static Future<UserModels> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        'https://librarysystemflutterteam.runasp.net/api/Registration/SignIn',
        data: {
          "email": email,
          "password": password,
        },
      );
      return UserModels.fromJson(response.data);
    } on DioException catch (e) {
      print('Error: ${e}');
      rethrow;
    } catch (e) {
      print('Error: ${e}');
      rethrow;
    }
  }

  static Future<UserModels> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      Response response = await dio.post(
        'https://librarysystemflutterteam.runasp.net/api/Registration/SignUp',
        data: {
          "email": email,
          "password": password,
          "name": name,
        },
      );
      return UserModels.fromJson(response.data);
    } on DioException catch (e) {
      print('Error: ${e}');
      rethrow;
    } catch (e) {
      print('Error: ${e}');
      rethrow;
    }
  }
}
