import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObsecure;
  final Function() onTap;
  const PasswordFormField({
    super.key,
    required this.controller,
    required this.isObsecure,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      keyboardType: TextInputType.text,
      cursorColor: Colors.black, // Only numbers can be entered
      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: kBlackColor),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password can not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: kPrimaryColor
        ),

        contentPadding:
        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        suffixIcon: IconButton(
          color: Colors.black,
          icon: Icon(
            isObsecure ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
