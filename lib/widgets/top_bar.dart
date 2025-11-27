import 'package:flutter/material.dart';
import 'package:flutter_application_1/values/text_styles.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 左上角 Logo 和标题
        const Row(
          children: [
            // Icon(Icons.monitor_heart, color: Colors.blueAccent, size: 30),
            AssetImage('images/logo_img@2x.png'),
            Text(
              '液冷假负载测试平台',
              style: white16BoldTextStyle
            ),
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
