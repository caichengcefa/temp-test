import 'package:flutter/material.dart';

class ServerIllustrationPlaceholder extends StatelessWidget {
  const ServerIllustrationPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用一个方块和 BoxShadow 模拟发光效果和环绕的圆环
    return Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 模拟服务器机柜 (一个带光晕的方块)
          Container(
            width: 120,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900.withValues(alpha: 0.8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.cyan,
                  blurRadius: 25.0,
                  spreadRadius: -10.0,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // 模拟环绕光环 (简化为带阴影的圆)
          ...List.generate(3, (index) {
            return Transform.scale(
              scale: 1.0 + index * 0.4,
              child: Container(
                width: 150,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: index == 0
                          ? Colors.purpleAccent.withValues(alpha: 0.6)
                          : index == 1
                              ? Colors.greenAccent.withValues(alpha: 0.6)
                              : Colors.cyan.withValues(alpha: 0.6),
                      blurRadius: 15.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
