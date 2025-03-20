import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../constants/colo_extension.dart';
import '../constants/styles.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/img/robot.json'),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'loading ....',
              textStyle: Styles.kFontSize36.copyWith(color: TColor.gray),
              colors: TColor.primaryG,
            ),
          ],
        ),
      ],
    );
  }
}
