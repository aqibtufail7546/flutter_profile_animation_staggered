import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final Color color;
  final double size;
  final List<Color> gradient;
  final IconData icon;
  final double elevation;

  const ProfileAvatar({
    Key? key,
    required this.color,
    required this.size,
    required this.gradient,
    required this.icon,
    this.elevation = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.white,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: elevation + 4,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: elevation,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: size * 0.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
