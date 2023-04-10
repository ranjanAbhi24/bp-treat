import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';

class DropDownFormField extends StatelessWidget {
  final String title;
  final String text;
  final String value;
  final bool isEmpty;
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChange;

  const DropDownFormField({
    required this.title,
    required this.text,
    required this.value,
    required this.isEmpty,
    this.items,
    this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 10),
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return Column(
              children: [
                InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    filled: true,
                    fillColor: kSecondaryColor,
                    // labelStyle: textStyle,
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 16.0),
                    hintText: title,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  isEmpty: isEmpty,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value,
                      isDense: true,
                      onChanged: onChange,
                      items: items,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
