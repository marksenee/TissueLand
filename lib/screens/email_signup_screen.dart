import 'package:flutter/material.dart';
import 'package:tissue_land/widgets/custom_header.dart';

class EmailSignupScreen extends StatefulWidget {
  const EmailSignupScreen({super.key});

  @override
  State<EmailSignupScreen> createState() => _EmailSignupScreenState();
}

class _EmailSignupScreenState extends State<EmailSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(title: '회원가입'), // 헤더 적용
      body: const Center(child: Text('본문 내용')),
    );
  }
}
