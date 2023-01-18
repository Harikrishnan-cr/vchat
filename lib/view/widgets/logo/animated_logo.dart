



import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class AnimatedLogoWidget extends StatelessWidget {
  const AnimatedLogoWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.isReapet
  }) : super(key: key);

  final double width;
  final double height;
final bool isReapet;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset('assets/86826-chat-icon.json',
            width: width * 0.5, height: height * 0.5, repeat: isReapet));
  }
}
