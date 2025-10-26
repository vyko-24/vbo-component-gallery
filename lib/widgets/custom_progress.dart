import 'package:flutter/material.dart';

enum ProgressVariant { linear, circular, custom }

class CustomProgress extends StatelessWidget {
  final double? value; 
  final ProgressVariant variant; 
  final Color? color; 
  final Color? backgroundColor; 
  const CustomProgress({
    Key? key,
    this.value,
    required this.variant,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  Widget _buildProgress() {
    switch (variant) {
      case ProgressVariant.linear:
        return LinearProgressIndicator(
          value: value,
          color: color ?? Colors.blue,
          backgroundColor: backgroundColor ?? Colors.grey.shade300,
          minHeight: 6,
          borderRadius: BorderRadius.circular(5),
        );

      case ProgressVariant.circular:
        return SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            value: value,
            color: color ?? Colors.blue,
            backgroundColor: backgroundColor ?? Colors.grey.shade300,
            strokeWidth: 5,
          ),
        );

      case ProgressVariant.custom:
        return SizedBox(
          height: 60,
          width: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: value,
                color: backgroundColor ?? Colors.grey.shade300,
                strokeWidth: 8,
              ),
              CircularProgressIndicator(
                value: value,
                color: color ?? Colors.purple,
                strokeWidth: 4,
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildProgress();
  }
}
