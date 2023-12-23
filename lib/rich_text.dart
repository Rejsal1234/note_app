import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:note_app/utils/color.dart';

class RichTextFormatter extends StatelessWidget {
  const RichTextFormatter(
      {required this.content, required this.title, super.key});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$title ",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: lightTextColor),
        children: <TextSpan>[
          TextSpan(
            text: content,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
