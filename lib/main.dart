import 'package:demo_app_with_intigration/AuthPage/AuthPage.dart';
import 'package:demo_app_with_intigration/Screens/home_screen.dart';
import 'package:demo_app_with_intigration/Theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  // runApp(
  //   MultiProvider(
  //     providers: [],
  //     child: MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      // home: const AuthPage(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
            // if (snapshot.hasData && snapshot.data != null) {
            //   return const HomeScreen();
            // }
          }
          return const AuthPage();
        },
      ),
      // // theme: ThemeData(
      //   textTheme: GoogleFonts.comfortaaTextTheme(),
      // ),
      // theme: darkTheme,
      // theme: CustomThemes.darkTheme,
    );
  }
}
