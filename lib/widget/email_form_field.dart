import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  const EmailFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black, // Only numbers can be entered
      style: TextStyle(color: Colors.black.withOpacity(0.8)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email can not be empty';
        } else if (!GetUtils.isEmail(value)) {
          return "Please enter a correct email address";
        }
        return null;
      },
      decoration: InputDecoration(
errorStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
  color: kPrimaryColor
),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}