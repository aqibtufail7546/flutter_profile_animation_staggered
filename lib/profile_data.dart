import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String skill;
  final String address;
  final String phone;
  final String email;
  final String experience;
  final String education;
  final String projects;
  final String languages;
  final Color color;
  final List<Color> gradient;
  final IconData avatarIcon;

  ProfileData({
    required this.name,
    required this.skill,
    required this.address,
    required this.phone,
    required this.email,
    required this.experience,
    required this.education,
    required this.projects,
    required this.languages,
    required this.color,
    required this.gradient,
    required this.avatarIcon,
  });
}
