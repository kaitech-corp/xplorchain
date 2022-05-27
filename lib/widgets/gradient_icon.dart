import 'package:flutter/material.dart';

import '../services/constants/constants.dart';

/// Gradient icon generator.
class GradientIcon extends StatelessWidget {

  final IconData icon;
  final double size;

  const GradientIcon({Key? key, required this.icon, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}