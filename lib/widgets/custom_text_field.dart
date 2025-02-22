import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final double width; // 👈 추가: 가로 길이를 조절하는 매개변수
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.width = 350, // 👈 기본값 설정 (비밀번호 입력 필드 외에는 350 사용)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // 👈 가로 길이 적용
      height: 38,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Pretandard-Medium'),
          border: InputBorder.none,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB9B9B9), width: 1.5),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF54C392), width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
