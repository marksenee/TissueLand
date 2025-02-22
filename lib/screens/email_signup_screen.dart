import 'package:flutter/material.dart';
import 'package:tissue_land/widgets/custom_text_field.dart';

class EmailSignupScreen extends StatefulWidget {
  const EmailSignupScreen({Key? key}) : super(key: key);

  @override
  _EmailSignupScreenState createState() => _EmailSignupScreenState();
}

class _EmailSignupScreenState extends State<EmailSignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController addressDetailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool get isFormComplete =>
      nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          phoneNumberController.text.isNotEmpty &&
          addressController.text.isNotEmpty &&
          addressDetailController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입',
            style: TextStyle(
                fontFamily: 'Pretendard-Medium',
                fontWeight: FontWeight.bold,
                fontSize: 22)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 37.0), // Adjust the value to control the left padding
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '회원가입을 위한 \n정보를 입력해 주세요',
                    style: TextStyle(
                      fontFamily: 'Pretendard-ExtraBold',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF54C392),

                    ),
                  ),
                ),
              ),

              const SizedBox(height: 80),
              CustomTextField(
                hintText: "이름을 입력하세요",
                controller: nameController,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                hintText: "이메일을 입력하세요",
                controller: emailController,
              ),
              const SizedBox(height: 30),

              // 비밀번호 입력 필드 (가로 크기 줄이기)
              SizedBox(
                child: CustomTextField(
                  hintText: "비밀번호를 입력하세요",
                  controller: passwordController,
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),

              // 휴대폰 번호 입력 필드 + 인증받기 버튼 (오른쪽 정렬)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 37), // 왼쪽 여백 추가
                    child: SizedBox(
                      width: 250,
                      child: CustomTextField(
                        hintText: "휴대폰 번호를 입력하세요",
                        controller: phoneNumberController,
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(color:  Color(0xFF54C392), width: 1),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // 네모 박스 모서리 둥글게
                        ),
                      ),
                      child: const Text("인증받기"),

                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // 주소 입력 필드 + 주소검색 버튼 (오른쪽 정렬)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 37), // 왼쪽 여백 추가
                    child: SizedBox(
                      width: 250,
                      child: CustomTextField(
                        hintText: "주소를 입력하세요",
                        controller: addressController,
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color:  Color(0xFF54C392), width: 1),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // 네모 박스 모서리 둥글게
                        ),
                      ),
                      child: const Text("주소검색"),

                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              CustomTextField(
                hintText: "상세 주소를 입력하세요",
                controller: addressDetailController,
              ),
              const Spacer(), // Pushes the button to the bottom
              SizedBox(
                width: 438,
                height: 66,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFormComplete
                        ? const Color(0xFF54C392)
                        : const Color(0xFFB9B9B9),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: isFormComplete
                      ? () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("회원가입 성공!")),
                      );
                    }
                  }
                      : null,
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                        fontFamily: 'Pretendard-Medium',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
