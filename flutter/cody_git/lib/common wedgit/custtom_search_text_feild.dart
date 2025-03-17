import 'package:flutter/material.dart';

import '../constants/colo_extension.dart';
import 'custtom_textfield.dart';

class CusttomSearchTextFeild extends StatelessWidget {
  const CusttomSearchTextFeild({
    super.key,
    required this.txtSearch,
    required this.SearshTestHint,
    required this.dropDownListItems,
    required this.onChanged,
  });

  final TextEditingController txtSearch;
  final String SearshTestHint;
  final List<String> dropDownListItems;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      height: 45,
      decoration: BoxDecoration(
          color: TColor.gray.withOpacity(.2),
          borderRadius: BorderRadius.circular(20),
         // boxShadow: TColor.kBoxShadow
      ),
      child: CustomTextField(
        hitText: SearshTestHint,
        icon: Icons.search_rounded,
        controller: txtSearch,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
