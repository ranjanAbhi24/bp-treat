import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



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
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          fontStyle: FontStyle.italic,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
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
