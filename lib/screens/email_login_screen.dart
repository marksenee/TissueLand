import 'package:flutter/material.dart';
import 'package:tissue_land/widgets/custom_header.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(title: '로그인'), // 헤더 적용
      body: const Center(child: Text('본문 내용')),
    );
  }
}
