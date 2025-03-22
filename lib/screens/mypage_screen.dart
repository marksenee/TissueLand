import 'package:flutter/material.dart';
import 'package:tissue_land/screens/cart_screen.dart';
import 'package:tissue_land/screens/home_screen.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  _MypageScreenState createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  int _selectedIndex = 2; // 현재 선택된 바텀 네비게이션 아이템 (홈 기본 선택)

  // 화면을 전환하는 함수
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      );

    } else if (index == 1) {
      // 홈 클릭 시 홈 화면으로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 2) {
      setState(() {
        _selectedIndex = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
    title: const Padding(
    padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
    child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
    '마이페이지',
    style: TextStyle(
    fontFamily: 'Gumi Romance',
    fontSize: 30,
    color: Color(0xFF54C392),
    ),
    ),
    ),
    ),
    actions: [
    Padding(
    padding: const EdgeInsets.only(right: 10),
    child: IconButton(
    icon: const Icon(Icons.shopping_cart),
    onPressed: () {},
    color: Colors.black,
    ),
    ),
    ],
    bottom: PreferredSize(
    preferredSize: const Size.fromHeight(2.0),
    child: Container(
    color: const Color(0xFFF1F1F1),
    height: 2.0,
    ),
    ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '장바구니',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF54C392), // 선택된 아이템 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
        onTap: _onItemTapped, // 탭 선택 시 색상 변경
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("마이페이지",
              //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("사용자 이름", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("사용자 이메일", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text("주문/배송 현황",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              OrderItem(status: "주문 확인 중", statusColor: Colors.green),
              OrderItem(status: "주문 확인 완료", statusColor: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String status;
  final Color statusColor;

  OrderItem({required this.status, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.grey.shade300,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(status,
                    style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("상품명을 입력하세요", style: TextStyle(color: Colors.black)),
                Text("색상 / 수량", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
