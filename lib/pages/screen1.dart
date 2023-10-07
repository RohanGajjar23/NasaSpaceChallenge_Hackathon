import 'dart:developer';
import 'dart:ffi';

import 'package:demo_app_with_intigration/models/solar_model.dart';
import 'package:demo_app_with_intigration/widgets/consts/planet_card.dart';
import 'package:flutter/material.dart';

class Screen_One extends StatelessWidget {
  const Screen_One({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isLeft = true;
    List<SolarModel> model = planet;
    int x = 0;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: size.width / 10),
            ),
          ),
          SizedBox(
            height: size.height / 90,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: planet.length,
              itemBuilder: (context, index) {
                x = index;
                isLeft = (x % 2 != 0);
                return PlanetCard(
                  isleft: isLeft,
                  model: planet[index],
                );
              },
            ),
          ),
          // Image.asset(
          //   "assets/images/mercury.png",
          //   fit: BoxFit.cover,
          //   height: size.height / 3,
          // ),
          SizedBox(
            height: size.height / 90,
          ),
        ],
      ),
    );
  }
}
