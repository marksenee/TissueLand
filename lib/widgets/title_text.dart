import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final double fontSize; // 폰트 크기 조절 가능
  final Color color; // 색상 조절 가능

  const TitleText({
    Key? key,
    this.fontSize = 60, // 기본 크기 40
    this.color = const Color(0xFF54C392), // 기본 색상 (초록색)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '티슈랜드',
      style: TextStyle(
        fontFamily: 'Gumi Romance',
        fontSize: fontSize,
        color: color, // 여기서 전달된 color 사용
      ),
    );
  }
}
