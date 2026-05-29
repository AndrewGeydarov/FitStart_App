import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';

class PlaceholderBox extends StatelessWidget {
  final double? width;
  final double height;
  final String label;
  final double radius;
  final IconData? icon;

  const PlaceholderBox({
    super.key,
    this.width,
    required this.height,
    this.label = 'Фото',
    this.radius = 12,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.textGray, size: 26),
              const SizedBox(height: 4),
            ],
            Text(
              label,
              style: const TextStyle(color: AppColors.textGray, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
