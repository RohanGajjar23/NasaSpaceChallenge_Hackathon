import 'dart:developer';
import 'dart:io';

import 'package:demo_app_with_intigration/models/solar_model.dart';
import 'package:flutter/material.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PlanetUI extends StatefulWidget {
  const PlanetUI({super.key, required this.model});
  final SolarModel model;

  @override
  State<PlanetUI> createState() => _PlanetUIState();
}

class _PlanetUIState extends State<PlanetUI> {
  bool isloading = true;
  late File f;
  @override
  void initState() {
    super.initState();
    downloadFile();
  }

  Future<void> downloadFile() async {
    final response = await http.get(Uri.parse(widget.model.model));
    if (response.statusCode == 200) {
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/${widget.model.name}.glb';
      File file = File(filePath);
      file.writeAsBytesSync(response.bodyBytes);
      setState(() {
        f = file;
        log(f.toString());
        log(f.uri.toString());
        isloading = false;
      });
      // Handle file download and save
      // For example, you might save the file and update `downloadedFile`:
      // downloadedFile = await saveToFile(response.bodyBytes);
      // and then use `setState` to trigger a rebuild if needed.
    } else {
      // Handle error
      log("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        !isloading
            ? SizedBox(
                width: size.width,
                height: size.height,
                child: BabylonJSViewer(src: f.uri.toString()))
            : Container(
                width: size.width,
                height: size.height,
                color: Colors.black,
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                    child: const CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
        Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.bottomLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: size.width / 1.75,
            height: size.height / 3,
            alignment: Alignment.bottomLeft,
            color: const Color.fromARGB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: size.height / 20,
                  // color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Name : ${widget.model.name}",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height / 200,
                ),
                Container(
                  height: size.height / 20,
                  // color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  moons : ${widget.model.moons}",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height / 200,
                ),
                Container(
                  height: size.height / 20,
                  // color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Distance Sun : ${widget.model.distanceSun}",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height / 200,
                ),
                Container(
                  height: size.height / 20,
                  // color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Mass : ${widget.model.mass}",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height / 200,
                ),
                Container(
                  height: size.height / 20,
                  // color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Radius : ${widget.model.radius}",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height / 200,
                ),
                Container(
                  height: size.height / 20,
                  // color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Description : ${widget.model.description}",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
