import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_app_with_intigration/models/solar_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlanetTile extends StatelessWidget {
  const PlanetTile({super.key, required this.model});
  final SolarModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      elevation: 5,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width / 70),
        width: size.width / 1.1,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          image: const DecorationImage(
            image: AssetImage('assets/images/space_image1.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(size.width / 40),
        ),
        child: Row(
          children: [
            SizedBox(
              width: size.width / 30,
            ),
            SizedBox(
              width: size.width / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height / 80,
                  ),
                  const AutoSizeText(
                    'This is a long text that will automatically shrink to fit the available space.',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                    maxLines: 2, // Set the maximum number of lines (optional)
                    minFontSize: 12.0, // Minimum font size (optional)
                    overflow:
                        TextOverflow.ellipsis, // Overflow behavior (optional)
                  ),
                  SizedBox(
                    height: size.height / 80,
                  ),
                ],
              ),
            ),
            Expanded(
                child: CachedNetworkImage(
              imageUrl: model.images,
              height: size.height / 4.5,
              width: size.height / 4.5,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/jupiter.png',
                height: size.height / 4.5,
                width: size.height / 4.5,
                fit: BoxFit.cover,
              ),
            )),
            SizedBox(
              width: size.width / 20,
            ),
          ],
        ),
      ),
    );
  }
}
