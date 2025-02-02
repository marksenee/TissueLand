import 'package:flutter/material.dart';
import 'package:tissue_land/screens/email_login_screen.dart';
import 'package:tissue_land/screens/email_signup_screen.dart';
import 'package:tissue_land/widgets/title_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // "티슈랜드" 텍스트
            const TitleText(),
            const SizedBox(height: 80), // 간격 추가

            // "이메일 로그인" 버튼
            SizedBox(
              width: 350,
              height: 66,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,  // 배경색
                  foregroundColor: Color(0xFF54C392),  // 글자색
                  side: const BorderSide(color:  Color(0xFF54C392), width: 1), // 테두리
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // 네모 박스 모서리 둥글게
                  ),
                ),
                onPressed: () {
                  // TODO: 로그인 기능 추가
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailLoginScreen()),
                  );
                },
                child: const Text(
                  '이메일 로그인',
                  style: TextStyle(fontFamily: 'Pretendard-Medium.otf',fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20), // 간격 추가

            // "이메일 회원가입" 버튼
            SizedBox(
              width: 350,
              height: 66,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF54C392),  // 글자색
                  side: const BorderSide(color:  Color(0xFF54C392), width: 1), // 테두리
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailSignupScreen()),
                  );
                },
                child: const Text(
                  '이메일 회원가입',
                  style: TextStyle(fontFamily: 'Pretendard-Medium.otf',fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
