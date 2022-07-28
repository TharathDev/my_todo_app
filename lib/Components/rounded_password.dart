import 'package:flutter/material.dart';
import 'package:my_todo_app/Components/text_field_container.dart';
import 'package:my_todo_app/constants.dart';

class RoundedPassword extends StatelessWidget {
  final ValueChanged<String> onchange;
  const RoundedPassword({
    Key? key,
    required this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onchange,
        decoration: InputDecoration(
            hintText: "Password",
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
