import 'package:flutter/material.dart';
import 'package:fly_weather/providers/airports_provider.dart';
import 'package:fly_weather/providers/auth_proivders.dart';
import 'package:fly_weather/providers/weather_provider.dart';
import 'package:fly_weather/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProivders()),
        ChangeNotifierProvider(create: (_) => AirportsProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
        home: Scaffold(body: SignupScreen()),
      ),
    );
  }
}
