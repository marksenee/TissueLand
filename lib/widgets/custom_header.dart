import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title; // 헤더 제목
  final Color backgroundColor; // 배경 색상
  final Color textColor; // 텍스트 색상
  final bool showBackButton; // 뒤로 가기 버튼 표시 여부

  const CustomHeader({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.white, // 기본 배경색: 흰색
    this.textColor = Colors.black, // 기본 텍스트 색상: 검정
    this.showBackButton = true, // 기본적으로 뒤로 가기 버튼 보이게 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0, // 그림자 제거
      centerTitle: true, // 제목을 중앙 정렬
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Pretandart-extrabold',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
      leading: showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context), // 이전 화면으로 이동
      )
          : null, // 뒤로 가기 버튼 숨길 수 있도록 설정
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(69); // 높이 69px 고정
}
