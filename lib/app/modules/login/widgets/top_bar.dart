import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/style/text_styles.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 左上角 Logo 和标题
        Row(
          children: [
            Assets.images.logoImg2x.image(width: 36, height: 36),
            SizedBox(width: 12),
            Text('液冷假负载测试平台', style: white16BoldTextStyle),
          ],
        ),
        // 右上角 语言切换
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Row(
            children: [
              Text('中', style: TextStyle(color: Colors.blue)),
              SizedBox(width: 4),
              Text('|', style: TextStyle(color: Colors.white54)),
              SizedBox(width: 4),
              Text('EN', style: TextStyle(color: Colors.white54)),
            ],
          ),
        ),
      ],
    );
  }
}
