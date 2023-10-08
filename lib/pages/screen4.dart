import 'dart:developer';

import 'package:demo_app_with_intigration/AuthPage/LoginAPI.dart';
import 'package:demo_app_with_intigration/EventsManager/eventsApi.dart';
import 'package:flutter/material.dart';

class Screen_Four extends StatefulWidget {
  const Screen_Four({super.key});

  @override
  State<Screen_Four> createState() => _Screen_FourState();
}

class _Screen_FourState extends State<Screen_Four> {
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    List events = await SpaceDevsService().getUpcomingLaunches();
    for (var e in events) {
      log(e.toString());
      break; // Separator for readability
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: Text(
          "Click to get Events",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground, fontSize: 40),
        ),
      ),
    );
    ;
  }
}
