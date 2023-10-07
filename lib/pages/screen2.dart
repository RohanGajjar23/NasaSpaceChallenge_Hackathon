import 'package:flutter/material.dart';

class Screen_Two extends StatelessWidget {
  const Screen_Two({super.key});

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
