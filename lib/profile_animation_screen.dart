import 'package:flutter/material.dart';
import 'package:flutter_staggered_sir_assigment/profile_avatar.dart';
import 'package:flutter_staggered_sir_assigment/profile_data.dart';
import 'package:flutter_staggered_sir_assigment/profile_info_item.dart';
import 'package:flutter_staggered_sir_assigment/profile_info_section.dart';

class ProfileAnimationScreen extends StatefulWidget {
  const ProfileAnimationScreen({Key? key}) : super(key: key);

  @override
  State<ProfileAnimationScreen> createState() => _ProfileAnimationScreenState();
}

class _ProfileAnimationScreenState extends State<ProfileAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _positionController;
  late AnimationController _widthController;
  late AnimationController _heightController;
  late AnimationController _opacityController;

  late Animation<double> _positionAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<double> _opacityAnimation;

  int _selectedProfileIndex = -1;
  bool _isAnimating = false;
  bool _isCardOpen = false;

  final List<ProfileData> _profiles = [
    ProfileData(
      name: "John Doe",
      skill: "Senior Flutter Developer",
      address: "123 Tech Street, App City, NY 10001",
      phone: "+1 234 567 8901",
      email: "john.doe@example.com",
      experience: "8+ years",
      education: "MSc in Computer Science",
      projects: "Mobile Banking App, E-commerce Platform",
      languages: "English, Spanish",
      color: Colors.blue.shade600,
      gradient: [Colors.blue.shade400, Colors.blue.shade700],
      avatarIcon: Icons.code,
    ),
    ProfileData(
      name: "Jane Smith",
      skill: "UI/UX Designer",
      address: "456 Design Avenue, Creative Town, CA 90210",
      phone: "+1 987 654 3210",
      email: "jane.smith@example.com",
      experience: "6+ years",
      education: "BFA in Graphic Design",
      projects: "Healthcare Dashboard, Travel App",
      languages: "English, French",
      color: Colors.purple.shade600,
      gradient: [Colors.purple.shade400, Colors.purple.shade700],
      avatarIcon: Icons.brush,
    ),
    ProfileData(
      name: "Alex Johnson",
      skill: "Backend Developer",
      address: "789 Server Road, Data Valley, WA 98101",
      phone: "+1 456 789 0123",
      email: "alex.johnson@example.com",
      experience: "7+ years",
      education: "BSc in Computer Engineering",
      projects: "Cloud Storage Solution, API Gateway",
      languages: "English, German",
      color: Colors.green.shade600,
      gradient: [Colors.green.shade400, Colors.green.shade700],
      avatarIcon: Icons.storage,
    ),
    ProfileData(
      name: "Sam Wilson",
      skill: "Product Manager",
      address: "321 Strategy Lane, Vision Hills, TX 75001",
      phone: "+1 321 654 9870",
      email: "sam.wilson@example.com",
      experience: "9+ years",
      education: "MBA in Product Management",
      projects: "CRM System, IoT Platform",
      languages: "English, Mandarin",
      color: Colors.orange.shade600,
      gradient: [Colors.orange.shade400, Colors.orange.shade700],
      avatarIcon: Icons.pie_chart,
    ),
    ProfileData(
      name: "Taylor Reed",
      skill: "DevOps Engineer",
      address: "654 Pipeline Street, Cloud City, IL 60007",
      phone: "+1 567 890 1234",
      email: "taylor.reed@example.com",
      experience: "5+ years",
      education: "BSc in Information Technology",
      projects: "CI/CD Pipeline, Kubernetes Cluster",
      languages: "English, Japanese",
      color: Colors.red.shade600,
      gradient: [Colors.red.shade400, Colors.red.shade700],
      avatarIcon: Icons.cloud,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _positionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _widthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _heightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _positionAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _positionController, curve: Curves.easeOutQuad),
    );

    _widthAnimation = Tween<double>(begin: 60, end: 650).animate(
      CurvedAnimation(parent: _widthController, curve: Curves.easeOut),
    );

    _heightAnimation = Tween<double>(begin: 60, end: 500).animate(
      CurvedAnimation(parent: _heightController, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _opacityController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _positionController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  void _startAnimation(int index) {
    if (_isAnimating || _isCardOpen) return;

    setState(() {
      _selectedProfileIndex = index;
      _isAnimating = true;
    });

    _positionController.forward().then((_) {
      _widthController.forward().then((_) {
        _heightController.forward().then((_) {
          _opacityController.forward().then((_) {
            setState(() {
              _isAnimating = false;
              _isCardOpen = true;
            });
          });
        });
      });
    });
  }

  void _reverseAnimation() {
    if (_isAnimating || !_isCardOpen) return;

    setState(() {
      _isAnimating = true;
    });

    _opacityController.reverse().then((_) {
      _heightController.reverse().then((_) {
        _widthController.reverse().then((_) {
          _positionController.reverse().then((_) {
            setState(() {
              _selectedProfileIndex = -1;
              _isAnimating = false;
              _isCardOpen = false;
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFF7F9FC),
              const Color(0xFFE4E9F2),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: size.height * 0.15,
              child: Container(
                width: 70,
                height: size.height * 0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colors.grey,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _profiles.length,
                    (index) => GestureDetector(
                      onTap: () => _startAnimation(index),
                      child: ProfileAvatar(
                        color: _profiles[index].color,
                        size: 50,
                        gradient: _profiles[index].gradient,
                        icon: _profiles[index].avatarIcon,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (_selectedProfileIndex >= 0)
              AnimatedBuilder(
                animation: Listenable.merge([
                  _positionAnimation,
                  _widthAnimation,
                  _heightAnimation,
                  _opacityAnimation
                ]),
                builder: (context, child) {
                  final cardWidth = _widthAnimation.value;
                  final cardHeight = _heightAnimation.value;

                  final maxCardWidth = size.width - 100;
                  final actualCardWidth =
                      cardWidth > maxCardWidth ? maxCardWidth : cardWidth;

                  final finalLeftPosition = (size.width - actualCardWidth) / 2;
                  final finalTopPosition = 120.0;

                  final currentRowHeight =
                      (size.height * 0.7) / _profiles.length;
                  final initialLeftPosition = 55.0;
                  final initialTopPosition = size.height * 0.15 +
                      (_selectedProfileIndex * currentRowHeight) +
                      (currentRowHeight - 50) / 2;

                  final leftPosition = initialLeftPosition +
                      (_positionAnimation.value *
                          (finalLeftPosition - initialLeftPosition));

                  final topPosition = initialTopPosition +
                      (_positionAnimation.value *
                          (finalTopPosition - initialTopPosition));

                  final safeLeftPosition = leftPosition.clamp(
                      20.0, size.width - actualCardWidth - 40);

                  final safeTopPosition =
                      topPosition.clamp(40.0, size.height - cardHeight - 40);

                  return Positioned(
                    left: safeLeftPosition,
                    top: safeTopPosition,
                    child: GestureDetector(
                      onTap: _isAnimating ? null : _reverseAnimation,
                      child: Container(
                        width: actualCardWidth,
                        height: cardHeight,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              Colors.grey.shade50,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: _profiles[_selectedProfileIndex]
                                  .color
                                  .withOpacity(0.25),
                              blurRadius: 20,
                              spreadRadius: 3,
                              offset: const Offset(0, 10),
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 30,
                              spreadRadius: 5,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 15,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: _profiles[_selectedProfileIndex]
                                        .gradient,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -25,
                              left: (actualCardWidth - 110) / 2,
                              width: 110,
                              height: 110,
                              child: ProfileAvatar(
                                color: _profiles[_selectedProfileIndex].color,
                                size: 110,
                                gradient:
                                    _profiles[_selectedProfileIndex].gradient,
                                icon:
                                    _profiles[_selectedProfileIndex].avatarIcon,
                                elevation: 8,
                              ),
                            ),
                            Positioned(
                              top: 95,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Opacity(
                                opacity: _opacityAnimation.value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 25, 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        _profiles[_selectedProfileIndex].name,
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey.shade800,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors:
                                                _profiles[_selectedProfileIndex]
                                                    .gradient,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: _profiles[
                                                      _selectedProfileIndex]
                                                  .color
                                                  .withOpacity(0.3),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          _profiles[_selectedProfileIndex]
                                              .skill,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ProfileInfoSection(
                                              title: "CONTACT INFO",
                                              color: _profiles[
                                                      _selectedProfileIndex]
                                                  .color,
                                              gradient: _profiles[
                                                      _selectedProfileIndex]
                                                  .gradient,
                                              items: [
                                                ProfileInfoItem(
                                                  icon: Icons.phone,
                                                  text: _profiles[
                                                          _selectedProfileIndex]
                                                      .phone,
                                                  color: _profiles[
                                                          _selectedProfileIndex]
                                                      .color,
                                                ),
                                                ProfileInfoItem(
                                                  icon: Icons.email,
                                                  text: _profiles[
                                                          _selectedProfileIndex]
                                                      .email,
                                                  color: _profiles[
                                                          _selectedProfileIndex]
                                                      .color,
                                                ),
                                                ProfileInfoItem(
                                                  icon: Icons.location_on,
                                                  text: _profiles[
                                                          _selectedProfileIndex]
                                                      .address,
                                                  color: _profiles[
                                                          _selectedProfileIndex]
                                                      .color,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: ProfileInfoSection(
                                              title: "PROFESSIONAL",
                                              color: _profiles[
                                                      _selectedProfileIndex]
                                                  .color,
                                              gradient: _profiles[
                                                      _selectedProfileIndex]
                                                  .gradient,
                                              items: [
                                                ProfileInfoItem(
                                                  icon: Icons.work,
                                                  text:
                                                      "Experience: ${_profiles[_selectedProfileIndex].experience}",
                                                  color: _profiles[
                                                          _selectedProfileIndex]
                                                      .color,
                                                ),
                                                ProfileInfoItem(
                                                  icon: Icons.school,
                                                  text:
                                                      "Education: ${_profiles[_selectedProfileIndex].education}",
                                                  color: _profiles[
                                                          _selectedProfileIndex]
                                                      .color,
                                                ),
                                                ProfileInfoItem(
                                                  icon: Icons.folder,
                                                  text:
                                                      "Projects: ${_profiles[_selectedProfileIndex].projects}",
                                                  color: _profiles[
                                                          _selectedProfileIndex]
                                                      .color,
                                                ),
                                                ProfileInfoItem(
                                                  icon: Icons.language,
                                                  text:
                                                      "Languages: ${_profiles[_selectedProfileIndex].languages}",
                                                  color: _profiles[
                                                          _selectedProfileIndex]
                                                      .color,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (_isCardOpen)
                              Positioned(
                                right: 15,
                                top: 15,
                                child: GestureDetector(
                                  onTap: _reverseAnimation,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: 16,
                                      color: _profiles[_selectedProfileIndex]
                                          .color,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
