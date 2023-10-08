class SolarModel {
  SolarModel(
      {required this.images,
      required this.moons,
      required this.mass,
      required this.distanceSun,
      required this.name,
      required this.description,
      required this.radius,
      required this.distanceEarth,
      required this.model});
  late final String images;
  late final int moons;
  late final String mass;
  late final String distanceSun;
  late final String name;
  late final String description;
  late final String radius;
  late final String distanceEarth;
  late final String model;

  SolarModel.fromJson(Map<String, dynamic> json) {
    images = json['images'] ?? '';
    moons = json['moons'] ?? 0;
    mass = json['mass'] ?? '';
    distanceSun = json['distance _sun'] ?? '';
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    radius = json['radius'] ?? '';
    distanceEarth = json['distance_earth'] ?? '';
    model = json['model'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['images'] = images;
    data['moons'] = moons;
    data['mass'] = mass;
    data['distance _sun'] = distanceSun;
    data['name'] = name;
    data['description'] = description;
    data['radius'] = radius;
    data['distance_earth'] = distanceEarth;
    data['model'] = model;
    return data;
  }
}
