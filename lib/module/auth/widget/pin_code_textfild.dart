import 'package:flutter/material.dart';



class PinCodeTextField extends StatelessWidget {
  const PinCodeTextField({super.key,
  required this.controller,
   required this.maxLine,
    required this.width,
    required this.validator,
  }
);
  final TextEditingController controller;
 final int maxLine;
  final double width;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: width,
      child: TextFormField(
        maxLines: maxLine,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
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
