class AirportModel {
  final String airport_name;
  final String country_name;
  final String timezone;
  final String iata_code;
  final String geoname_id;

  AirportModel({
    required this.airport_name,
    required this.country_name,
    required this.timezone,
    required this.iata_code,
    required this.geoname_id,
  });
}

class AirportsModels {
  late List<AirportModel> airports;

  AirportsModels({
    required this.airports,
  });

  factory AirportsModels.fromJson(List data) {
    List<AirportModel> airports = data.map((item) {
      return AirportModel(
        airport_name: item["airport_name"] ?? "no data",
        country_name: item["country_name"] ?? "no data",
        timezone: item["timezone"] ?? "no data",
        iata_code: item["iata_code"] ?? "no data",
        geoname_id: item["geoname_id"] ?? "no data",
      );
    }).toList();
    return AirportsModels(airports: airports);
  }

  
}
