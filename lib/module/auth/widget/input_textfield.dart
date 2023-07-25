import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String text;
  final IconData? icon;
  final TextInputType? inputType;
  final bool isVisible;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final Function()? onPressed;
  final Function(String)? onChange;

  const InputTextField({
    super.key,
    this.hintText,
    required this.controller,
    required this.validator,
    required this.text,
    this.inputType,
    this.icon,
    this.isVisible = false,
    this.onTap,
    this.onPressed,
    this.readOnly = false,
    this.onChange,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            // color: kBlackColor?.withOpacity(0.6),
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          inputFormatters: inputFormatters,
          onTap: onPressed,
          onChanged: onChange,
          cursorColor: kBlackColor,
          controller: controller,
          keyboardType: inputType,
          obscureText: isVisible,
          readOnly: readOnly,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,

            //filled: true,
            // fillColor: kSecondaryColor,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                //  borderSide: BorderSide.none,
                borderSide: const BorderSide(color: Colors.black)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                //  borderSide: BorderSide.none,
                borderSide: const BorderSide(color: Colors.black)
            ),
            suffixIcon: IconButton(
              color: Colors.black,
              icon: Icon(icon),
              onPressed: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
