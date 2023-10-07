import 'dart:ffi';

import 'package:flutter/material.dart';

class Screen_One extends StatelessWidget {
  const Screen_One({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
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
            )
          ],
        ),
      ),
    );
  }
}
