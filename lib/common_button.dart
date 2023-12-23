import 'package:flutter/material.dart';
import 'package:note_app/utils/color.dart';
import 'package:note_app/utils/size.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {required this.buttonName, required this.onPress, super.key});

  final String buttonName;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(fs16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          gradient: const LinearGradient(
            colors: [button1Color, button2Color, button3Color],
          ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: darkPrimaryAndLightBgColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
