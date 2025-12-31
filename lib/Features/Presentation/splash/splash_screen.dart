import 'package:bookly/Core/constant/color_const.dart';
import 'package:bookly/Core/router/router_name.dart';
import 'package:bookly/Features/Presentation/splash/Widgets/SplashLeftPage.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
late AnimationController _controller;
  late Animation<double> _leftPage;
  late Animation<double> _rightPage;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _leftPage = Tween<double>(
      begin: -pi / 3,
      end: 0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _rightPage = Tween<double>(
      begin: pi / 2.5,
      end: 0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    // Navigate after animation
    Future.delayed(const Duration(seconds: 3), () {
      context.go(AppRoutes.home);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: SizedBox(
          width: 250,
          height: 180,
          child: Stack(
            children: [
              _buildLeftPage(),
            SizedBox(width: 20,), 
              _buildRightPage(),
              Text(
                'Read Free Book',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    
    );
  }

  Widget _buildLeftPage() {
    return AnimatedBuilder(
      animation: _leftPage,
      builder: (_, child) {
        return Transform(
          alignment: Alignment.centerRight,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_leftPage.value),
          child: child,
        );
      },
      child: SplashLeftPage(isLeft: true),
    );
  }

  Widget _buildRightPage() {
    return AnimatedBuilder(
      animation: _rightPage,
      builder: (_, child) {
        return Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_rightPage.value),
          child: child,
        );
      },
      child: SplashLeftPage(isLeft: false),
    );
  }


}