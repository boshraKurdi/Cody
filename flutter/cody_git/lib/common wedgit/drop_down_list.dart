import 'package:flutter/material.dart';
import 'package:cody/constants/styles.dart';
import 'package:cody/constants/colo_extension.dart';

class DropDownList extends StatelessWidget {
  final List<String> item;
  final Widget? icon;
  final Widget? hint;
  final void Function(String?) onChanged;
  const DropDownList({
    super.key,
    required this.item,
    this.hint,
    required this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  width: 100,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            items: item.map(
                  (name) => DropdownMenuItem(
                    value: name,
                    child: Text(name, style: Styles.kFontSize14),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            icon: icon ?? Icon(Icons.expand_more, color: TColor.black),
            hint: hint),
      ),
    );
  }
}
