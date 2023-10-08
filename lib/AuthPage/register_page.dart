import 'package:demo_app_with_intigration/AuthPage/login_api.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.fontSize, required this.size});
  final double fontSize;
  final Size size;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            SizedBox(
              width: widget.size.width / 1.5,
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
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
            SizedBox(
              width: widget.size.width / 1.5,
              child: TextFormField(
                controller: emailController,
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
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
            SizedBox(
              width: widget.size.width / 1.5,
              child: TextFormField(
                controller: passwordController,
                onChanged: (value) {
                  password = value;
                },
                showCursor: true,
                decoration: const InputDecoration(
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
            SizedBox(
              width: widget.size.width / 1.5,
              child: TextFormField(
                controller: confirmpasswordController,
                showCursor: true,
                decoration: const InputDecoration(
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
                child: const Text(
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
