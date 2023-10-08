class SatelliteModel {
  late String name;
  late String owner;
  late String date;
  late String country;
  late String purpose;
  late String users;
  late String orbit;
  late String source;

  SatelliteModel(
      {required this.name,
      required this.owner,
      required this.date,
      required this.country,
      required this.purpose,
      required this.users,
      required this.orbit,
      required this.source});

  SatelliteModel.fromJson(Map<String, dynamic> json) {
    name = json['Current Official Name of Satellite'].toString();
    country = json['Country/Org of UN Registry'].toString();
    owner = json['Contractor'].toString();
    date = json['Date of Launch'].toString();
    purpose = json['Purpose'].toString();
    users = json['Users'].toString();
    orbit = json['Type of Orbit'].toString();
    source = json['Source'].toString();
  }
}
