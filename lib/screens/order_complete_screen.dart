import 'package:flutter/material.dart';

class OrderCompleteScreen extends StatefulWidget {
  final String productImage; // productImage 변수

  const OrderCompleteScreen({super.key, required this.productImage}); // 생성자에서 productImage 필수로 받음

  @override
  State<OrderCompleteScreen> createState() => _OrderCompleteScreenState();
}

class _OrderCompleteScreenState extends State<OrderCompleteScreen> {
  int _paymentMethod = 1;
  bool _cashReceiptEnabled = false;
  bool _orderConfirmed = false;
  String? _selectedBank;
  String? _cashReceiptType;
  String? selectedReceiptType = '소득공제용';

  // 예제 상품 이미지 URL (실제 상품 이미지 URL로 교체 가능)
  final String productImage = 'https://via.placeholder.com/107x67/D9D9D9/808080?text=Product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: const Color(0xFFF1F1F1),
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '주문이 완료되었습니다.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFF54C392),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '0000.00.00일 17시까지 입금 완료해주세요',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Divider(height: 50, thickness: 2),
              const Text('배송정보', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              const Text('이름', style: TextStyle(fontSize: 16)),
              const Text('연락처', style: TextStyle(fontSize: 16)),
              const Text('주소', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              const Divider(height: 40, thickness: 2),
              const Text('입금 정보', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('입금 금액', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF767676))),
                  const SizedBox(width: 20),
                  const Text('입금 금액', style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  const SizedBox(height: 5),
                  const Text('예금주', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF767676))),
                  const SizedBox(width: 38),
                  const Text('이름', style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  const SizedBox(height: 5),
                  const Text('입금 은행', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF767676))),
                  const SizedBox(width: 20),
                  const Text('농협은행 3021728879611', style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  const SizedBox(height: 5),
                  const Text('입금 기한', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF767676))),
                  const SizedBox(width: 20),
                  const Text('2025년 00월 00일 00시까지', style: TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(height: 40, thickness: 2),
              const Text('주문 상품', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),

              // 상품 이미지 + 상품 정보 Row 추가
              Row(
                children: [
                  // 상품 이미지 (왼쪽 배치, 배경색 추가)
                  Container(
                    width: 107,
                    height: 67,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9), // 배경색
                      borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                      image: DecorationImage(
                        image: NetworkImage(productImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12), // 이미지와 텍스트 사이 간격

                  // 상품명 & 가격
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('상품명 예제', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text('₩18,000', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('총 결제 금액', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('20,500원', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
