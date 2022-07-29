import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_todo_app/Components/already_have_account_check.dart';
import 'package:my_todo_app/Components/rounded_button.dart';
import 'package:my_todo_app/Components/rounded_input.dart';
import 'package:my_todo_app/Components/rounded_password.dart';
import 'package:my_todo_app/Screens/Login/login_screen.dart';
import 'package:my_todo_app/Screens/SignUp/components/background.dart';
import 'package:my_todo_app/constants.dart';

class Body extends StatelessWidget {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  Body({
    Key? key,
  }) : super(key: key);

  // firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void SignUp(String email, String password) async {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (uid) => {
              Fluttertoast.showToast(
                  msg: "User created succesful. Please Sign in!"),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              ),
            },
          )
          .catchError(
        (onError) {
          Fluttertoast.showToast(msg: onError!.message);
        },
      );
    }

    return Background(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "JOIN US NOW!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/img/signup.png",
                height: size.height * 0.20,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Username",
                onChange: (value) {
                  emailController.text = value;
                },
              ),
              RoundedPassword(
                onchange: (value) {
                  passwordController.text = value;
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                press: () {
                  SignUp(
                    emailController.text,
                    passwordController.text,
                  );
                },
              ),
              SizedBox(height: size.height * 0.05),
              AlreadyHaveAccountCheck(
                login: false,
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              )
            ]),
      ),
    );
  }
}
