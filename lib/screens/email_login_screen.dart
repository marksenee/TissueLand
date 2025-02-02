import 'package:flutter/material.dart';
import 'package:tissue_land/widgets/custom_text_field.dart';
import 'package:tissue_land/widgets/title_text.dart';

class EmailLoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // 폼 유효성 검사용 키

  EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인',
      style: TextStyle(fontFamily: 'Pretendard-Medium', fontWeight: FontWeight.bold, fontSize: 22),)),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0), // 상하 여백 추가
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // 🎯 Column 높이를 내용물에 맞춤
            mainAxisAlignment: MainAxisAlignment.start, // 🎯 상단 정렬로 변경
            children: [
              const Center(child: TitleText()),
              SizedBox(height: 100),
              CustomTextField(
                hintText: "이메일을 입력하세요",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "이메일을 입력하세요.";
                  } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return "올바른 이메일 형식이 아닙니다.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomTextField(
                hintText: "비밀번호를 입력하세요",
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "비밀번호를 입력하세요.";
                  } else if (value.length < 6) {
                    return "비밀번호는 최소 6자 이상이어야 합니다.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 80),
              SizedBox(
                width: 350,
                height: 66,
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF54C392),  // 배경색
                    foregroundColor: Colors.white,  // 글자색
                    // side: const BorderSide(color:  Color(0xFF54C392), width: 1), // 테두리
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // 네모 박스 모서리 둥글게
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("로그인 성공!")),
                      );
                    }
                  },
                  child: const Text('로그인',
                        style: TextStyle(fontFamily: 'Pretendard-Medium', fontWeight: FontWeight.bold, fontSize: 22)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
