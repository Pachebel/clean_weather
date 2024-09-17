import 'package:flutter/material.dart';

enum ColorFocus { focused, unfocused, inactive }

extension IconColor on Color? {
  Color focus(ColorFocus focus) {
    switch (focus) {
      case ColorFocus.focused:
        return this!;
      case ColorFocus.unfocused:
        return this!.withOpacity(0.7);
      case ColorFocus.inactive:
        return this!.withOpacity(0.5);
    }
  }
}
