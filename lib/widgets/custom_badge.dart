import 'package:flutter/material.dart';

enum BadgeVariant { info, success, warning, error }

class CustomBadge extends StatelessWidget {
  final String text;
  final BadgeVariant variant;

  const CustomBadge({
    super.key,
    required this.text,
    this.variant = BadgeVariant.info,
  });

  Map<String, Color> _getColors() {
    switch (variant) {
      case BadgeVariant.info:
        return {
          "background": Colors.blue.shade500,
          "text": Colors.white,
        };
      case BadgeVariant.success:
        return {
          "background": Colors.green.shade500,
          "text": Colors.white,
        };
      case BadgeVariant.warning:
        return {
          "background": Colors.orange.shade400,
          "text": Colors.black87,
        };
      case BadgeVariant.error:
        return {
          "background": Colors.red.shade500,
          "text": Colors.white,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = _getColors();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colors["background"],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: colors["text"],
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
