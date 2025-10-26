import 'package:flutter/material.dart';

enum AvatarVariant { circular, rounded, square }

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final AvatarVariant variant;
  final double size;
  final Color? backgroundColor;

  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.variant = AvatarVariant.circular,
    this.size = 60.0,
    this.backgroundColor,
  });

  BorderRadius _getBorderRadius() {
    switch (variant) {
      case AvatarVariant.circular:
        return BorderRadius.circular(size / 2); 
      case AvatarVariant.rounded:
        return BorderRadius.circular(12);
      case AvatarVariant.square:
        return BorderRadius.zero;
    }
  }

  Widget _buildContent() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: _getBorderRadius(),
        child: Image.network(
          imageUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallback();
          },
        ),
      );
    } else {
      return _buildFallback();
    }
  }

  Widget _buildFallback() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade400,
        borderRadius: _getBorderRadius(),
      ),
      alignment: Alignment.center,
      child: Text(
        (initials != null && initials!.isNotEmpty)
            ? initials!.toUpperCase()
            : "?",
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.4, 
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: _buildContent(),
    );
  }
}
