import 'package:flutter/material.dart';

class DesignWithGradient extends StatelessWidget {
  const DesignWithGradient({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(127, 236, 96, 41),
            Color.fromARGB(255, 167, 167, 145),
            Color.fromARGB(127, 236, 96, 41),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
