import 'package:flutter/material.dart';

enum ChipVariant { defaultChip, outlined, colored }

class CustomChip extends StatelessWidget {
  final String label;
  final ChipVariant variant;
  final VoidCallback? onDeleted;
  final bool selected;

  const CustomChip({
    super.key,
    required this.label,
    this.variant = ChipVariant.defaultChip,
    this.onDeleted,
    this.selected = false,
  });

  Map<String, Color> _getColors() {
    switch (variant) {
      case ChipVariant.defaultChip:
        return {
          "background": selected ? Colors.grey.shade400 : Colors.grey.shade200,
          "text": Colors.black87,
          "border": Colors.transparent,
        };

      case ChipVariant.outlined:
        return {
          "background": selected ? Colors.blue.shade50 : Colors.white,
          "text": selected ? Colors.blue.shade700 : Colors.grey.shade800,
          "border": selected ? Colors.blue : Colors.grey.shade400,
        };

      case ChipVariant.colored:
        return {
          "background": selected ? Colors.blue.shade600 : Colors.blue.shade300,
          "text": Colors.white,
          "border": Colors.transparent,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = _getColors();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colors["background"],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors["border"]!, width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Text(
            label,
            style: TextStyle(
              color: colors["text"],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (onDeleted != null) ...[
            const SizedBox(width: 6),
            GestureDetector(
              onTap: onDeleted,
              child: Icon(
                Icons.close,
                size: 16,
                color: colors["text"],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
