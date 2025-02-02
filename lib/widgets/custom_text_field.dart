import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 38,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Pretandard-Medium'),
          border: InputBorder.none, // 기본 테두리 제거
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB9B9B9), width: 1.5),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF54C392), width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(  // 오류가 발생할 때의 밑줄 색상
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: const UnderlineInputBorder(  // 오류가 발생한 상태에서 포커스 시 밑줄 색상
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
        validator: validator, // 유효성 검사 적용
      ),
    );
  }
}
