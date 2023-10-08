import 'package:demo_app_with_intigration/models/solar_model.dart';
import 'package:demo_app_with_intigration/widgets/consts/animated_tile.dart';
import 'package:flutter/material.dart';

class Screen_One extends StatelessWidget {
  const Screen_One({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, User",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: size.width / 10),
            ),
            SizedBox(
              height: size.height / 90,
            ),

            Row(
              children: [
                Text(
                  "Image of the Day ",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: size.width / 10,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Theme.of(context).colorScheme.onBackground,
                )
              ],
            ),
            Divider(
              thickness: size.height / 1000,
            ),
            SizedBox(
              height: size.height / 90,
            ),

            Image.asset(
              "assets/images/space_image2.jpg",
              fit: BoxFit.cover,
              height: size.height / 2,
              width: size.width / 1,
            ),

            SizedBox(
              height: size.height / 90,
            ),

            Row(
              children: [
                Text(
                  "Explore Planets ",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: size.width / 10,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Theme.of(context).colorScheme.onBackground,
                )
              ],
            ),
            Divider(
              thickness: size.height / 1000,
            ),
            SizedBox(
              height: size.height / 90,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width / 90),
              height: size.height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PlanetTile(
                    model: planet[0],
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
      ),
    );
  }
}