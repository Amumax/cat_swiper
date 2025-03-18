import 'package:flutter/material.dart';

class DislikeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DislikeButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: const Icon(
        Icons.close,
        size: 30,
      ),
    );
  }
}
