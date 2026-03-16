import 'package:flutter/material.dart';
import 'package:fly_weather/Request_state.dart';
import 'package:fly_weather/providers/airports_provider.dart';
import 'package:fly_weather/screens/weather_details_screen.dart';
import 'package:fly_weather/widgets/card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AirportsProvider>().get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyCard(
          child: Icon(
            Icons.airplanemode_active_outlined,
            size: 24,
            color: Colors.white,
          ),
          color: Colors.blueAccent,
        ),
        title: Text(
          "FlyWeather",
          style: TextStyle(fontSize: 15, color: Colors.black),
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
        child: Center(child: Consumer<AirportsProvider>(
          builder: (context, provider, child) {
            if (provider.state == RequestState.idle) {
              provider.get();
            }
            return switch (provider.state) {
              RequestState.idle => Text('Loding...'),
              RequestState.loading => CircularProgressIndicator(),
              RequestState.error => Text('Error loading airports'),
              RequestState.empty => Text('No airports found'),
              RequestState.success => ListView.builder(
                  itemCount: provider.airports?.airports.length ?? 0,
                  itemBuilder: (context, index) {
                    final airport = provider.airports!.airports[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WeatherDetailsScreen(
                                    location: airport.timezone)));
                      },
                      child: MyCard(
                        child: ListTile(
                          leading: MyCard(
                              color: Colors.lightBlueAccent,
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.airplane_ticket_outlined,
                                color: const Color.fromARGB(240, 255, 255, 255),
                              )),
                          trailing: Text(airport.timezone),
                          title: Text(airport.airport_name),
                          subtitle: Text(
                              '${airport.country_name} - ${airport.iata_code}'),
                        ),
                      ),
                    );
                  },
                ),
            };
          },
        )),
      ),
    );
  }
}
