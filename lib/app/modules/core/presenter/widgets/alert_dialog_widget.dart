import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    required this.title,
    required this.content,
    required this.primaryText,
    required this.primaryOnTap,
    required this.secondaryText,
    required this.secondaryOnTap,
    super.key,
  });

  final String title;
  final String content;
  final String primaryText;
  final VoidCallback primaryOnTap;
  final String secondaryText;
  final VoidCallback secondaryOnTap;

  @override
  Widget build(BuildContext context) {
    CupertinoDialogAction iosButton(VoidCallback onPressed, String text) {
      return CupertinoDialogAction(
        onPressed: onPressed,
        child: Text(text),
      );
    }

    TextButton androidButton(VoidCallback onPressed, String text) {
      return TextButton(
        onPressed: onPressed,
        child: Text(text),
      );
    }

    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(content),
      actions: [
        if (Platform.isAndroid) androidButton(primaryOnTap, primaryText),
        if (Platform.isAndroid) androidButton(secondaryOnTap, secondaryText),
        if (Platform.isIOS) iosButton(primaryOnTap, primaryText),
        if (Platform.isIOS) iosButton(secondaryOnTap, secondaryText),
      ],
    );
  }
}
