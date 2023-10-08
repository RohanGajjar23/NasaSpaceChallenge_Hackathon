import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app_with_intigration/models/satellite_model.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  List<SatelliteModel> models = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Satellites")
          .where('Country of Contractor', isEqualTo: "India")
          .snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.data == null) {
              return Center(
                child: Text(
                  "No Data Yet",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: size.width / 10),
                ),
              );
            }
            final data = snapshot.data!;
            models = data.docs
                .map((e) => SatelliteModel.fromJson(e.data()))
                .toList();

            return SafeArea(
              child: Column(
                children: [
                  Text(
                    "Satellites",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: size.height / 90,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: models.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration:
                              const BoxDecoration(color: Colors.white10),
                          child: ListTile(
                            title: Text(
                              models[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                            ),
                            subtitle: Text(
                              models[index].country,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
