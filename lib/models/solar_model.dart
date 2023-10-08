class SolarModel {
  late String name;
  late String description;
  late String distanceFromsun;
  late String distancefromearth;
  late String mass;
  late String radius;
  late int moons;
  late String image;

  SolarModel({
    required this.name,
    required this.description,
    required this.distanceFromsun,
    required this.distancefromearth,
    required this.mass,
    required this.radius,
    required this.moons,
    required this.image,
  });
}

List<SolarModel> parseSolarData(List<Map<String, dynamic>> jsonData) {
  List<SolarModel> solarList = [];

  for (var data in jsonData) {
    SolarModel solarModel = SolarModel(
      name: data['name'],
      description: data['description'],
      distanceFromsun: data['distance_sun'],
      distancefromearth: data['distance_earth'],
      mass: data['mass'],
      radius: data['radius'],
      moons: data['moons'],
      image: '', // Add the image URL here if available in your JSON
    );

    solarList.add(solarModel);
  }

  return solarList;
}

List<SolarModel> planet = [
  SolarModel(
    name: "Earth",
    description: "Our home planet...",
    mass: "5.972 × 10^24 kg",
    radius: "6,371 km",
    distanceFromsun: "149.6 million km",
    distancefromearth: "0 km",
    moons: 1,
    image: "assets/images/mercury.png",
  )
];
// void main() {
//   // Assuming 'planets' contains your JSON data
//   List<SolarModel> solarObjects = parseSolarData(planets);

//   // Now, you have a list of SolarModel objects
//   for (var solarModel in solarObjects) {
//     print('Name: ${solarModel.name}');
//     print('Description: ${solarModel.description}');
//     // Print other properties as needed
//   }
// }
