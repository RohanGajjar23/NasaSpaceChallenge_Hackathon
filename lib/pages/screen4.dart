import 'package:demo_app_with_intigration/AuthPage/LoginAPI.dart';
import 'package:demo_app_with_intigration/EventsManager/eventsApi.dart';
import 'package:flutter/material.dart';

class Screen_Four extends StatefulWidget {
  const Screen_Four({super.key});

  @override
  State<Screen_Four> createState() => _Screen_FourState();
}

class _Screen_FourState extends State<Screen_Four> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {
          List events = await SpaceDevsService().getUpcomingLaunches();
          for (var e in events) {
            print('Name: ${e['name']}');

            var status = e['status'];
            if (status != null) {
              print('Status Name: ${status['name']}');
              print('Status Description: ${status['description']}');
            }
            var provider = e['launch_service_provider'];
            if (provider != null) {
              print('Provider Name: ${provider['name']}');
              print('Provider Type: ${provider['type']}');
            }

            print('---'); // Separator for readability
          }
        },
        child: Container(
          width: 200,
          height: 200,
          child: Text(
            "Click to get Events",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 40),
          ),
        ),
      ),
    );
    ;
  }
}
