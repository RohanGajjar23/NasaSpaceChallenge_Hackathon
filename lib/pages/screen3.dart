import 'package:flutter/material.dart';

class Screen_Three extends StatelessWidget {
  const Screen_Three({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Nothing yet",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
