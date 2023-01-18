



import 'package:flutter/cupertino.dart';
import 'package:vchat/core/color/colours.dart';
import 'package:vchat/core/fonts/fonts.dart';

class ButtonCommonFilledWidget extends StatelessWidget {
  const ButtonCommonFilledWidget({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: commonColorDeepPurple,
          borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Text(
        buttonText,
        style: GoogleFont.buttonTextStyle,
      )),
    );
  }
}
