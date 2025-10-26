import 'package:flutter/material.dart';

enum AlertVariant { info, success, warning, error }

class CustomAlert extends StatelessWidget {
  final String message;
  final AlertVariant variant;
  final IconData? icon; 
  final VoidCallback? onClose; 
  
  const CustomAlert({
    Key? key,
    required this.message,
    required this.variant,
    this.icon,
    this.onClose,
  }) : super(key: key);

  Color _getBackgroundColor() {
    switch (variant) {
      case AlertVariant.info:
        return Colors.blue.shade100;
      case AlertVariant.success:
        return Colors.green.shade100;
      case AlertVariant.warning:
        return Colors.amber.shade100;
      case AlertVariant.error:
        return Colors.red.shade100;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case AlertVariant.info:
        return Colors.blue.shade300;
      case AlertVariant.success:
        return Colors.green.shade300;
      case AlertVariant.warning:
        return Colors.amber.shade300;
      case AlertVariant.error:
        return Colors.red.shade300;
    }
  }

  IconData _getDefaultIcon() {
    switch (variant) {
      case AlertVariant.info:
        return Icons.info_outline;
      case AlertVariant.success:
        return Icons.check_circle_outline;
      case AlertVariant.warning:
        return Icons.warning_amber_rounded;
      case AlertVariant.error:
        return Icons.error_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: _getBackgroundColor(), 
        border: Border.all(color: _getBorderColor(), width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon ?? _getDefaultIcon(),
            color: _getBorderColor(),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
          ),

          if (onClose != null)
            IconButton(
              icon: const Icon(Icons.close),
              color: Colors.grey.shade700,
              onPressed: onClose,
            ),
        ],
      ),
    );
  }
}
