import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class SpaceDevsService {
  final String baseUrl = 'https://lldev.thespacedevs.com/2.2.0';

  Future<List> getUpcomingLaunches() async {
    final response = await http.get(Uri.parse('$baseUrl/launch/upcoming/'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('Failed to load upcoming launches');
    }
  }

  final String apodUrl = 'https://api.nasa.gov/planetary/apod';

// Provide your NASA API key here
  final String apiKey = 'KIr6eY8tbHVVqdx07tjUgdbqRMO4aU2ZHbQSfbo3';

  Future<String> fetchAndUploadImage() async {
    // Fetch the APOD data from NASA API
    final response = await http.get(Uri.parse('$apodUrl?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      String imageUrl = data['url'];

      // Fetch the image
      final responseImage = await http.get(Uri.parse(imageUrl));
      if (responseImage.statusCode == 200) {
        // Save the image
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/apod.jpg';
        File file = File(filePath);
        file.writeAsBytesSync(responseImage.bodyBytes);

        final ext = file.path.split(".").last;
        final ref = FirebaseStorage.instance
            .ref()
            .child('Picture of the Day/image.$ext');

        // Upload to Firebase
        await ref.putFile(file, SettableMetadata(contentType: 'image/$ext'));

        // Get and return the download URL
        final String downloadUrl = await ref.getDownloadURL();
        return downloadUrl;
      } else {
        throw Exception('Failed to load image');
      }
    } else {
      throw Exception('Failed to load APOD data');
    }
  }
}
// }
