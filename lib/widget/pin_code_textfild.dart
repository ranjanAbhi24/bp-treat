import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';



class PinCodeTextField extends StatelessWidget {
  const PinCodeTextField({super.key,
  required this.controller,
   required this.maxLine,
    required this.width,
    required this.validator,
    this.inputType
  }
);
  final TextEditingController controller;
 final int maxLine;
  final double width;
  final TextInputType? inputType;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: width,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: inputType,
        cursorColor: kBlackColor,
        style: TextStyle(
          color: kBlackColor,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        maxLines: maxLine,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
           contentPadding: const EdgeInsets.all(10),
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
        ),
      ),
    );
  }
}
