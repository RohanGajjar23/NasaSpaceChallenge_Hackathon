import 'dart:developer';

import 'package:demo_app_with_intigration/EventsManager/eventsApi.dart';
import 'package:demo_app_with_intigration/Screens/home_screen.dart';
import 'package:demo_app_with_intigration/models/solar_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class apodURL {
  static String apodimg = '';
}

class LoginAPI {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  // Register with email and password
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return result.user;
    } catch (error) {
      print("error");
      print(error.toString());
      return null;
    }
  }

  // Sign in with email and passwords
  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("Logged in");
      apodURL.apodimg = (await SpaceDevsService().fetchAndUploadImage());
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
      return result.user;
    } catch (error) {
      print(error.toString());
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
      print(error.toString());
      return null;
    }
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
      print(satellite["Current Official Name of Satellite"]
          .toString()
          .replaceAll('/', '-'));
      await satellites
          .doc(satellite["Current Official Name of Satellite"]
              .toString()
              .replaceAll('/', '-'))
          .set(satellite);
      print("Uploading....");
    }
  }
}
