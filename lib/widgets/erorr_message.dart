import 'package:flutter/material.dart';

class ErorrMssg extends StatelessWidget {
  const ErorrMssg({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(2, 2),
              blurRadius: 4,
            )
          ]),
    );
  }
}
