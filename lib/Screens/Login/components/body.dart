import 'package:flutter/material.dart';
import 'package:my_todo_app/Components/already_have_account_check.dart';
import 'package:my_todo_app/Components/rounded_button.dart';
import 'package:my_todo_app/Components/rounded_input.dart';
import 'package:my_todo_app/Components/rounded_password.dart';
import 'package:my_todo_app/Screens/Login/components/background.dart';
import 'package:my_todo_app/Screens/SignUp/signup_screen.dart';
import 'package:my_todo_app/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                onChange: (value) {},
              ),
              RoundedPassword(
                onchange: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {},
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
