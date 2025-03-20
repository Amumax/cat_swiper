import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LikeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(40),
      ),
      child: Image.asset(
        'assets/icons/like_icon.png',
        width: 125,
        height: 125,
      ),
    );
  }
}
