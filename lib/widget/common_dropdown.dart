import 'package:flutter/material.dart';



class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key,
    required this.dropdownValue,
    required this.items,
    required this.onChange
  });

  final String dropdownValue;
  final List<String> items;
  final Function(String?)? onChange;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_up_sharp),
      elevation: 0,
      value: dropdownValue,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          color: Colors.black
      ),
      underline: const SizedBox.shrink(),
      items: items.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: onChange,

    );
  }
}
