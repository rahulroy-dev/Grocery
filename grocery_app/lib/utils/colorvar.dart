import 'package:flutter/material.dart';

Color bg = Colors.purple.shade400;
LinearGradient bg1 = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  stops: [0.1, 0.5, 0.7, 0.9],
  colors: [
    Colors.purple.shade700,
    Colors.purple.shade600,
    Colors.purple.shade500,
    Colors.purple.shade400,
  ],
);
