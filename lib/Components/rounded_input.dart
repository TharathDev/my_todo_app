import 'package:flutter/material.dart';
import 'package:my_todo_app/Components/text_field_container.dart';
import 'package:my_todo_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChange;
  final TextEditingController emailController = new TextEditingController();
  RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChange,
        controller: emailController,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
