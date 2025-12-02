import 'package:flutter/material.dart';

class BottomEffectPlaceholder extends StatelessWidget {
  const BottomEffectPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          // 模拟底部的发光波纹
          boxShadow: [
            BoxShadow(
              color: Colors.cyan.withValues(alpha: 0.4),
              blurRadius: 80,
              spreadRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
