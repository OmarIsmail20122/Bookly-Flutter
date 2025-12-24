import 'package:flutter/material.dart';

class SplashLeftPage extends StatelessWidget {
  const SplashLeftPage({super.key, required this.isLeft});
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
      return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        width: 125,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: isLeft ? const Radius.circular(25) : Radius.zero,
            topRight: !isLeft ? const Radius.circular(25) : Radius.zero,
            bottomLeft: isLeft ? const Radius.circular(25) : Radius.zero,
            bottomRight: !isLeft ? const Radius.circular(25) : Radius.zero,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
            )
          ],
        ),
        child: Center(
          child: Text(
            isLeft ? 'My' : 'Book',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

