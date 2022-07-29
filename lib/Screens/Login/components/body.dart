import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/Components/already_have_account_check.dart';
import 'package:my_todo_app/Components/rounded_button.dart';
import 'package:my_todo_app/Components/rounded_input.dart';
import 'package:my_todo_app/Components/rounded_password.dart';
import 'package:my_todo_app/Screens/Home/home_screen.dart';
import 'package:my_todo_app/Screens/Login/components/background.dart';
import 'package:my_todo_app/Screens/SignUp/signup_screen.dart';
import 'package:my_todo_app/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    void SignIn(String email, String password) async {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (uid) => {
              Fluttertoast.showToast(msg: "Log in succesful"),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
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
                    "WELCOME BACK",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 20),
                  ),
                ],
              ),
              Image.asset(
                "assets/img/signin.png",
                width: size.width * 0.8,
              ),
              RoundedInputField(
                hintText: "Your Username",
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
                text: "LOGIN",
                press: () {
                  SignIn(
                    emailController.text,
                    passwordController.text,
                  );
                },
              ),
              SizedBox(height: size.height * 0.05),
              AlreadyHaveAccountCheck(
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupScreen();
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
