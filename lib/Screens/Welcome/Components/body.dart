import 'package:flutter/material.dart';
import 'package:my_todo_app/Components/rounded_button.dart';
import 'package:my_todo_app/Screens/Login/login_screen.dart';
import 'package:my_todo_app/Screens/SignUp/signup_screen.dart';
import 'package:my_todo_app/Screens/Welcome/Components/background.dart';
import 'package:my_todo_app/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome To My TODO App.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                "assets/img/welcome.png",
                width: size.width * 0.7,
              ),
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              textColor: Colors.black,
              color: kPrimaryLightColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
