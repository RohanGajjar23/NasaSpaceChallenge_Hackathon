class SatelliteModel {
  late String name;
  late String owner;
  late String date;
  late String purpose;
  late String users;
  late String orbit;
  late String source;

  SatelliteModel(
      {required this.name,
      required this.owner,
      required this.date,
      required this.purpose,
      required this.users,
      required this.orbit,
      required this.source});

  SatelliteModel.fromJson(Map<String, dynamic> json) {
    name = json['Current Official Name of Satellite'] ?? '';
    owner = json['Country of Operator/Owner'] ?? '';
    date = json['Date of Launch'] ?? '';
    purpose = json['Purpose'] ?? '';
    users = json['Users'] ?? '';
    orbit = json['Type of Orbit'] ?? '';
    source = json['Source'] ?? '';
  }
}
