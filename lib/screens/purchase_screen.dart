import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  int _paymentMethod = 1;
  bool _cashReceiptEnabled = false;
  bool _orderConfirmed = false;
  String? _selectedBank;
  String? _cashReceiptType;
  String? selectedReceiptType = '소득공제용';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제', style: TextStyle(fontWeight: FontWeight.bold),),
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
              const Text('배송지', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              const Text('이름 010-0000-0000', style: TextStyle(fontSize: 16),),
              const Text('서울특별시 000 0000아파트', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Container(
                width: 375,
                height: 42,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white, // 배경색 흰색
                  border: Border.all(color: Color(0xFFD9D9D9)), // 테두리 색상 D9D9D9
                  borderRadius: BorderRadius.circular(4), // 모서리 살짝 둥글게
                ),
                alignment: Alignment.centerLeft,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '배송 메시지를 입력하세요',
                    border: InputBorder.none, // 테두리 제거 (Container에서 감싸고 있어서)
                  ),
                ),
              ),

              const Divider(height: 50, thickness: 2),
              const Text('주문상품', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              const Text('상품명을 입력하세요', style: TextStyle(fontSize: 16),),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('색상 / 수량', style: TextStyle(fontSize: 16),),
                  Text('18,000원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 40, thickness: 2),
              const Text('결제 수단', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _paymentMethod,
                    activeColor: Color(0xFF54C392), // 선택된 라디오 버튼 색상 변경
                    onChanged: (value) => setState(() => _paymentMethod = value as int),
                  ),
                  const Text('계좌이체 / 무통장입금', style: TextStyle(fontSize: 16),),
                ],
              ),
              if (_paymentMethod == 1)
                Column(
                  children: [
                    Container(
                      width: 367,
                      height: 47,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      margin: EdgeInsets.only(left: 8), // 왼쪽 여백 추가
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(4), // 살짝 둥근 모서리
                      ),
                      alignment: Alignment.centerLeft, // 왼쪽 정렬
                      child: DropdownButtonHideUnderline( // 밑줄 제거
                        child: DropdownButton<String>(
                          value: '농협은행',
                          items: const [
                            DropdownMenuItem(
                              value: '농협은행',
                              child: Text('농협은행'),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    SwitchListTile(
                      title: const Text('현금영수증'),
                      value: _cashReceiptEnabled,
                      activeColor: Color(0xFF54C392), // 스위치 활성화 색상 변경
                      onChanged: (value) => setState(() => _cashReceiptEnabled = value),
                    ),
                    if (_cashReceiptEnabled)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 367,
                            height: 47,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFD9D9D9)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            alignment: Alignment.centerLeft,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedReceiptType,
                                items: [
                                  DropdownMenuItem(
                                    value: '소득공제용',
                                    child: Text('소득공제용(휴대폰 번호)'),
                                  ),
                                  DropdownMenuItem(
                                    value: '지출증빙용',
                                    child: Text('지출증빙용(사업자번호)'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedReceiptType = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 8), // 간격 추가
                          Container(
                            width: 367,
                            height: 47,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFD9D9D9)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: selectedReceiptType == '소득공제용' ? '휴대폰 번호 입력' : '사업자번호 입력',
                                border: InputBorder.none, // 테두리 제거 (Container에서 테두리를 감싸고 있음)
                              ),
                              keyboardType: selectedReceiptType == '소득공제용'
                                  ? TextInputType.phone
                                  : TextInputType.number, // 입력 타입 설정
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              Row(
                children: [
                  Radio(value: 2, groupValue: _paymentMethod, onChanged: (value) => setState(() => _paymentMethod = value as int)),
                  const Text('신용/체크카드', style: TextStyle(fontSize: 16),),
                ],
              ),
              const Divider(height: 40, thickness: 2),
              const Text('결제 금액', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('상품 금액', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text('18,000원', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('배송비', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('2,500원', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
              const SizedBox(height: 32),
              CheckboxListTile(
                title: const Text('주문내용 확인 및 결제 동의'),
                activeColor: Color(0xFF54C392), // 선택된 라디오 버튼 색상 변경
                value: _orderConfirmed,
                onChanged: (value) => setState(() => _orderConfirmed = value ?? false),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _orderConfirmed ? () {} : null,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF54C392)),
                  child: const Text('결제하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
