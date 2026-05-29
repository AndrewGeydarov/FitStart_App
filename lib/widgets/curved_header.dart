import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 30,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CurvedHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double height;

  const CurvedHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.height = 240,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _HeaderClipper(),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: kPurpleGradient),
        padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 10),
              Text(
                subtitle!,
                style: const TextStyle(
                  color: Color(0xFFCAC4E8),
                  fontSize: 15,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
