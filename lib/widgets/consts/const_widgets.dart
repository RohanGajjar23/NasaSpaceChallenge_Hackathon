import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const String image1 = 'assets/animations/1.json';
const String image2 = 'assets/animations/2.json';
const String image3 = 'assets/animations/3.json';
const String image4 = 'assets/animations/4.json';
const String image5 = 'assets/animations/5.json';
const String image6 = 'assets/animations/try.json';
Widget buildSticker({required String image}) {
  return Container(
    child: Lottie.asset(
      image,
      height: 80,
      fit: BoxFit.cover,
    ),
  );
}
