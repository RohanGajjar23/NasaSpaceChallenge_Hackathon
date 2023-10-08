import 'package:demo_app_with_intigration/models/solar_model.dart';
import 'package:flutter/material.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({super.key, required this.isleft, required this.model});
  final bool isleft;
  final SolarModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: size.height / 3,
          color: Theme.of(context).colorScheme.background,
          child: Stack(
            children: [
              Positioned(
                top: size.height / 10,
                left: isleft ? 0 : size.width / 30,
                right: isleft ? size.width / 30 : 0,
                child: Container(
                  height: size.height / 5,
                  width: size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.9),
                  ),
                ),
              ),
              Positioned(
                left: isleft ? 0 : size.width / 3,
                right: isleft ? size.width / 3 : 0,
                child: Image.asset(
                  planet[0].image,
                  fit: BoxFit.cover,
                  height: size.width / 1.6,
                  width: size.width / 1.6,
                ),
              ),
              Positioned(
                top: 20,
                child: Text(
                  model.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 30),
                ),
              ),
              Positioned(
                child: Text(
                  model.description,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
