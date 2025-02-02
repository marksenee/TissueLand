import 'package:flutter/material.dart';
import 'package:tissue_land/widgets/custom_header.dart';
import 'package:tissue_land/widgets/title_text.dart';

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
      body: const Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleText(),
          SizedBox()

        ],
      )),
    );
  }
}
