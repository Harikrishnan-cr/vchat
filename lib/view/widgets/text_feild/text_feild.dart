



import 'package:flutter/material.dart';
import 'package:vchat/core/color/colours.dart';

class TextFeildCommonWidget extends StatelessWidget {
  const TextFeildCommonWidget({
    Key? key,
    required this.textEditingControllers,
    required this.labelText,
    required this.preFixIcons,
    this.passwordIcons,
    this.isVisible,
    this.onChanged,
    this.errorMessages
  }) : super(key: key);

  final TextEditingController textEditingControllers;
  final String labelText;
  final Widget? passwordIcons;
  final Icon? preFixIcons;
final bool? isVisible;
final String? errorMessages; 
final void Function(String)? onChanged;   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        onChanged: onChanged, 
        obscureText: isVisible ?? false,    
        controller: textEditingControllers,
        cursorColor: commonColorDeepPurple,
        decoration: InputDecoration(
          errorText: errorMessages,
            label: Text(
              labelText,
            ),
            suffixIcon: passwordIcons,
            prefixIcon: preFixIcons,
            labelStyle: const TextStyle(color: commonColorDeepPurple),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: commonColorDeepPurple,
                  width: 2.1,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                )),
            fillColor: Colors.white60,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
