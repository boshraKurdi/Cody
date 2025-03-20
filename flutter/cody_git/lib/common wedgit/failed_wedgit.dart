import 'package:flutter/material.dart';

import '../constants/colo_extension.dart';

class FailedWedgit extends StatelessWidget {
  const FailedWedgit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Icon(
          Icons.error,
          color: TColor.primaryColor2,
        ));
  }
}