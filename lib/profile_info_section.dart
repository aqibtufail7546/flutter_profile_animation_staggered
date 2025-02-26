import 'package:flutter/material.dart';
import 'package:flutter_staggered_sir_assigment/profile_info_item.dart';

class ProfileInfoSection extends StatelessWidget {
  final String title;
  final Color color;
  final List<Color> gradient;
  final List<ProfileInfoItem> items;

  const ProfileInfoSection({
    Key? key,
    required this.title,
    required this.color,
    required this.gradient,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.5),
                      color.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ...items,
      ],
    );
  }
}
