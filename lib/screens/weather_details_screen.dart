import 'package:flutter/material.dart';
import 'package:fly_weather/Request_state.dart';
import 'package:fly_weather/providers/weather_provider.dart';
import 'package:fly_weather/widgets/card.dart';
import 'package:provider/provider.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String location;
  const WeatherDetailsScreen({super.key, required this.location});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().get(widget.location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in ${widget.location}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white
            ],
          ),
        ),
        child: Center(
          child: Consumer<WeatherProvider>(
            builder: (context, provider, child) {
              return switch (provider.state) {
                RequestState.idle => const Text('Loading...'),
                RequestState.loading => const CircularProgressIndicator(),
                RequestState.error => const Text('Error loading weather'),
                RequestState.empty => const Text('No weather data found'),
                RequestState.success => SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: MyCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Main weather info
                          if (provider.weather!.weather_icons.isNotEmpty)
                            CircleAvatar(
                                radius: 50,
                                backgroundImage: Image.network(
                                  provider.weather!.weather_icons[0],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.image, size: 100),
                                ).image),
                          const SizedBox(height: 10),
                          Text(
                            '${provider.weather!.temperature}°C',
                            style: const TextStyle(
                                fontSize: 48, fontWeight: FontWeight.bold),
                          ),

                          if (provider.weather!.weather_descriptions.isNotEmpty)
                            Text(
                              provider.weather!.weather_descriptions[0],
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.grey),
                            ),
                          const SizedBox(height: 20),
                          // Details grid
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildDetailCard(
                                  'Humidity',
                                  '${provider.weather!.humidity}%',
                                  Icons.opacity),
                              _buildDetailCard(
                                  'Wind Speed',
                                  '${provider.weather!.wind_speed} km/h',
                                  Icons.air),
                              _buildDetailCard(
                                  'Pressure',
                                  '${provider.weather!.pressure} hPa',
                                  Icons.compress),
                              _buildDetailCard(
                                  'UV Index',
                                  '${provider.weather!.uv_index}',
                                  Icons.wb_sunny),
                              _buildDetailCard('Country',
                                  provider.weather!.country, Icons.location_on),
                              _buildDetailCard(
                                  'Observed',
                                  provider.weather!.observation_time,
                                  Icons.access_time),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              };
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String label, String value, IconData icon) {
    return MyCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
