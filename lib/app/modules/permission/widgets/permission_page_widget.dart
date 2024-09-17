import 'package:clean_weather/app/modules/core/presenter/extensions/theme/icon_focus.dart';
import 'package:clean_weather/app/modules/core/presenter/widgets/primary_button_widget.dart';
import 'package:clean_weather/app/modules/core/presenter/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';

class PermissionPageWidget extends StatelessWidget {
  const PermissionPageWidget({
    required this.icon,
    required this.title,
    required this.description,
    required this.primaryText,
    required this.primaryOnTap,
    required this.secondaryText,
    required this.secondaryOnTap,
    this.useSecondaryButton = true,
    super.key,
  });
  final IconData icon;
  final String title;
  final String description;
  final String primaryText;
  final VoidCallback primaryOnTap;
  final String secondaryText;
  final VoidCallback secondaryOnTap;
  final bool useSecondaryButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              icon,
              size: 80,
              color: Theme.of(context)
                  .colorScheme
                  .secondary
                  .focus(ColorFocus.focused),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              description,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PrimaryButtonWidget(
              onPressed: primaryOnTap,
              text: primaryText,
            ),
          ),
          if (useSecondaryButton)
            Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SecondaryButtonWidget(
                    onPressed: secondaryOnTap,
                    text: secondaryText,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
