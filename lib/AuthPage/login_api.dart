// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:demo_app_with_intigration/EventsManager/events_api.dart';
import 'package:demo_app_with_intigration/Screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApodURL {
  static String apodimg = '';
}

class LoadingProvider with ChangeNotifier {
  bool isLoading = false;
  bool isopen = false;

  void openClose() {
    isopen = !isopen;
    notifyListeners();
  }

  void openLoading() {
    isLoading = true;
    log("Called $isLoading");
    notifyListeners();
    LoadingProvider.delayedBack();
  }

  static Future<void> delayedBack() async {
    await Future.delayed(const Duration(seconds: 1));
    // SystemNavigator.pop();
  }

  void closeLoading() {
    isLoading = false;
    log("Called $isLoading");
    notifyListeners();
  }
}

class LoginAPI {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Register with email and password
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return result.user;
    } catch (error) {
      log("error");
      log(error.toString());
      return null;
    }
  }

  // Sign in with email and passwords
  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final loadingProvider =
          Provider.of<LoadingProvider>(context, listen: false);
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log("Logged in");
      // await uploadDataToFirestore();
      loadingProvider.openLoading();
      ApodURL.apodimg = (await SpaceDevsService().fetchAndUploadImage());
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
      loadingProvider.closeLoading();
      return result.user;
    } catch (error) {
      log(error.toString());
      return null;
    }
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential result =
            await _firebaseAuth.signInWithCredential(credential);
        return result.user;
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
    return null;
  }

  // Future<List<SolarModel>> getPlanets() async {
  //   final data = await _firebase.collection("Milky_Way").snapshots();
  //   log(data.toString());
  //   final doc = data.docs.map((e) => (SolarModel.fromMap(e.data()))).toList();
  //   log(data.docs[0].toString());
  //   return doc;
  // }

  Future<void> uploadDataToFirestore() async {
    // 1. Read and parse the JSON file
    String jsonString = await rootBundle.loadString('assets/Sat.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    // print(jsonData.);

    // Reference to Firestore collection
    CollectionReference satellites =
        FirebaseFirestore.instance.collection('Satellites');

    // 2. Iterate through each satellite entry
    // print(jsonData['Sheet1'].length);
    for (dynamic satellite in jsonData['Sheet1']) {
      // 3. Upload each satellite to Firestore
      log(satellite["Current Official Name of Satellite"]
          .toString()
          .replaceAll('/', '-'));
      await satellites
          .doc(satellite["Current Official Name of Satellite"]
              .toString()
              .replaceAll('/', '-'))
          .set(satellite);
      log("Uploading....");
    }
  }
}
