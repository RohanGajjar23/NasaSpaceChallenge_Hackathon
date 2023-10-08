import 'package:demo_app_with_intigration/AuthPage/login_api.dart';
import 'package:demo_app_with_intigration/AuthPage/login_page.dart';
import 'package:demo_app_with_intigration/AuthPage/register_page.dart';
// import 'package:demo_app_with_intigration/EventsManager/eventsApi.dart';
// import 'package:demo_app_with_intigration/Theme/theme.dart';
import 'package:flutter/material.dart';
// import 'package:googleapis/apigeeregistry/v1.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Duration animSpeed = const Duration(milliseconds: 500);
  double fontSize = 25;
  double textOpacity = 0.0;
  bool onRegisterPage = true;
  bool onLoginPage = false;

  @override
  void initState() {
    super.initState();
    // print("Temp");
    Position.leftPosi = -400; // Set the initial position

    // Give it a small delay to initiate animation after the widget builds
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        Position.leftPosi = -125; // Animate to a left position of 0
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        textOpacity = 1.0; // Fully show the text after 2 seconds
      });
    });
  }

  void bottomSheet(Size size, BuildContext context) {
    final isloading =
        Provider.of<LoadingProvider>(context, listen: false).isLoading;
    setState(() {
      Provider.of<LoadingProvider>(context, listen: false).openClose();
    });
    !isloading
        ? showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            backgroundColor:
                Theme.of(context).colorScheme.background.withOpacity(0.5),
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return SizedBox(
                    height: onRegisterPage
                        ? size.height / 1.3 +
                            MediaQuery.of(context).viewInsets.bottom
                        : size.height / 1.75 +
                            MediaQuery.of(context).viewInsets.bottom,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // color: Colors.greenAccent,
                          child: onRegisterPage
                              ? RegisterPage(
                                  fontSize: fontSize,
                                  size: MediaQuery.of(context).size)
                              : LoginPage(
                                  fontSize: fontSize,
                                  size: MediaQuery.of(context).size),
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height / 60,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              onRegisterPage = !onRegisterPage;
                            });
                          },
                          child: Container(
                            width: size.width / 4,
                            height: size.height / 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              !onRegisterPage ? "Register!" : "Login!",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).then((value) {
            setState(() {
              Provider.of<LoadingProvider>(context, listen: false).openClose();
            });
          })
        : const SizedBox();
  }

  // void ChangePage() {
  //   print("Chaning Page");
  //   onRegisterPage = !onRegisterPage;
  // }

  @override
  Widget build(BuildContext context) {
    // final bottom = MediaQuery.of(context).viewInsets.bottom;
    // final isloading = context.watch<LoadingProvider>().isLoading;
    bool isOpen = context.watch<LoadingProvider>().isopen;
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(children: [
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).colorScheme.background,
          child: Stack(children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: Position.leftPosi,
              height: size.height / 1,
              child: Image.asset(
                'assets/BG2.jpg',
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              width: size.width,
              left: size.width / 3.3,
              top: size.height / 2.5,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: textOpacity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      // color: Colors.green,
                      height: size.height / 15,
                      child: Text(
                        "Explore",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      // color: Colors.red,
                      height: size.height / 15,
                      child: Text(
                        "Space!",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 3,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isOpen ? 0 : 1,
                      child: InkWell(
                        onTap: () => bottomSheet(size, context),
                        // onTap: () async {
                        //   await SpaceDevsService().downloadImage();
                        // },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lets Go ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Container(
            //   alignment: Alignment.bottomCenter,
            //   child: InkWell(
            //     onTap: () {
            //       print("Clicked");
            //       setState(() {
            //         isOpen = !isOpen;
            //       });
            //     },
            //     child: AnimatedContainer(
            //       duration: const Duration(milliseconds: 500),
            //       width: isOpen ? size.width / 1.2 : size.width / 3,
            //       alignment: Alignment.center,
            //       height: isOpen ? size.height / 4 : size.height / 15,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: isOpen
            //             ? Color.fromARGB(100, 125, 125, 125)
            //             : Color.fromARGB(50, 100, 100, 100),
            //       ),
            //       child: isOpen
            //           ? Text("Login",
            //               style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //                   fontSize: 30,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold))
            //           : Text(
            //               "Lets Go",
            //               style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //                   fontSize: 30,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //     ),
            //   ),
            // )
          ]),
        ),
        // isloading
        //     ? AnimatedContainer(
        //         duration: const Duration(milliseconds: 500),
        //         width: size.width,
        //         height: size.height,
        //         // color: Colors.white,
        //         // child: Center(
        //         //   child: CircularProgressIndicator(
        //         //     color: Colors.red,
        //         //   ),
        //         // ),
        //       )
        //     : SizedBox(
        //         height: 0,
        //         width: 0,
        //       )
      ]),
    );
  }
}

class Position {
  static double? leftPosi;
}
