import 'package:demo_app_with_intigration/AuthPage/LoginAPI.dart';
import 'package:flutter/material.dart';

class RegsiterPage extends StatefulWidget {
  RegsiterPage({super.key, required this.fontSize, required this.size});
  double fontSize;
  Size size;
  @override
  State<RegsiterPage> createState() => _RegsiterPageState();
}

class _RegsiterPageState extends State<RegsiterPage> {
  String email = '';
  String password = '';
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      alignment: Alignment.center,
      width: widget.size.width / 2,
      height:
          widget.size.height / 2.5 + MediaQuery.of(context).viewInsets.bottom,
      color: const Color.fromARGB(0, 0, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widget.size.width / 1.5,
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Enter UserName",
                ),
                style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
                cursorColor: Colors.red,
              ),
            ),
            SizedBox(
              height: widget.size.height / 60,
            ),
            Container(
              width: widget.size.width / 1.5,
              child: TextFormField(
                controller: emailController,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter E-mail",
                ),
                style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
                cursorColor: Colors.red,
              ),
            ),
            SizedBox(
              height: widget.size.height / 60,
            ),
            Container(
              width: widget.size.width / 1.5,
              child: TextFormField(
                controller: passwordController,
                onChanged: (value) {
                  password = value;
                },
                showCursor: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                ),
                style: TextStyle(
                    fontSize: widget.fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                cursorColor: Colors.red,
                obscureText: true,
              ),
            ),
            SizedBox(
              height: widget.size.height / 60,
            ),
            Container(
              width: widget.size.width / 1.5,
              child: TextFormField(
                controller: confirmpasswordController,
                showCursor: true,
                decoration: InputDecoration(
                  hintText: "Enter Confirm Password",
                ),
                style: TextStyle(
                    fontSize: widget.fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                cursorColor: Colors.red,
                obscureText: true,
              ),
            ),
            SizedBox(
              height: widget.size.height / 60,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  LoginAPI().registerWithEmailAndPassword(email, password);
                  usernameController.clear();
                  emailController.clear();
                  passwordController.clear();
                  confirmpasswordController.clear();
                });
              },
              child: Container(
                width: widget.size.width / 4,
                height: widget.size.height / 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Register!",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
