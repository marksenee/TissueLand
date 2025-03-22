import 'package:flutter/material.dart';
import 'package:tissue_land/screens/home_screen.dart';
import 'package:tissue_land/screens/mypage_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> quantities = [1, 2, 2];
  List<bool> isSelected = [false, false, false];
  int _selectedIndex = 0; // 현재 선택된 바텀 네비게이션 아이템 (홈 기본 선택)


  // 화면을 전환하는 함수
  void _onItemTapped(int index) {
    if (index == 0) {
      // 장바구니 클릭 시 이동하지 않음 (현재 화면 유지)
      setState(() {
        _selectedIndex = 0;
      });
    } else if (index == 1) {
      // 홈 클릭 시 홈 화면으로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MypageScreen()),
      );
    }
  }

  void deleteSelectedItems() {
    int selectedCount = isSelected.where((e) => e).length;

    if (selectedCount == 0) {
      // 선택된 상품이 없을 경우
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 30, // 최대 세로 높이를 70으로 설정
              child: Center(
                child: Text(
                  "삭제할 상품을 1개 이상 선택해 주세요",
                  textAlign: TextAlign.center, // 텍스트를 중앙에 정렬
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            actions: [
              Center( // Center 위젯을 추가하여 버튼을 중앙에 배치
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF54C392),
                    minimumSize: Size(131, 40),
                  ),
                  child: const Text("확인"),
                ),
              ),
            ],
          );
        },
      );

    } else {
      // 선택된 상품이 있을 경우
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0), // Padding을 0으로 설정하여 세로 길이 감소
            content: Container(
              height: 70, // 최대 세로 높이를 127로 설정
              child: Center(
                child: Text(
                  "$selectedCount개의 상품을 삭제하시겠어요?",
                  textAlign: TextAlign.center, // 텍스트를 중앙에 정렬
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 버튼을 중앙에 배치
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Color(0xFFD9D9D9), width: 1), // 테두리 색 D9D9D9
                      minimumSize: Size(100, 40),
                    ),
                    child: const Text("취소"),
                  ),
                  SizedBox(width: 16), // 버튼들 사이에 간격을 추가
                  TextButton(
                    onPressed: () {
                      setState(() {
                        List<int> indexesToRemove = [];
                        for (int i = isSelected.length - 1; i >= 0; i--) {
                          if (isSelected[i]) {
                            indexesToRemove.add(i);
                          }
                        }
                        for (int index in indexesToRemove) {
                          quantities.removeAt(index);
                          isSelected.removeAt(index);
                        }
                      });
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF54C392),
                      minimumSize: Size(100, 40),
                    ),
                    child: const Text("확인"),
                  ),
                ],
              ),
            ],
          );
        },
      );


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경 색상 흰색으로 설정
      appBar: AppBar(
        title: Text("장바구니"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }, // 뒤로 가기 기능
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: const Color(0xFFF1F1F1),
            height: 2.0,
          ),
        ),
      ),
      body: Column(
        children: [
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: CheckboxListTile(
          title: Text("전체선택"),
          value: isSelected.every((e) => e),
          onChanged: (value) {
            setState(() {
              isSelected = List.filled(isSelected.length, value ?? false);
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
      TextButton(
        onPressed: deleteSelectedItems,
        child: Text("상품 삭제", style: TextStyle(color: Colors.red)),
      )
    ],

  ),
),

          Expanded(
            child: ListView.builder(
              itemCount: quantities.length,
              itemBuilder: (context, index) {
                return CartItem(
                  isSelected: isSelected[index],
                  quantity: quantities[index],
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      quantities[index] = newQuantity;
                    });
                  },
                  onSelected: (selected) {
                    setState(() {
                      isSelected[index] = selected;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      quantities.removeAt(index);
                      isSelected.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
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
    );
  }
}

class CartItem extends StatelessWidget {
  final bool isSelected;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<bool> onSelected;
  final VoidCallback onDelete;

  CartItem({
    required this.isSelected,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onSelected,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFD9D9D9), width: 0.5), // 테두리 색상
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (value) => onSelected(value ?? false),
            ),
            Container(
              width: 130,
              height: 120,
              color: Colors.grey[300], // 이미지 자리
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    "상품명을 입력하세요",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis, // 텍스트가 길어지면 생략
                    maxLines: 1,
                  ),
                  // SizedBox(height: 4),
                  Text(
                    "색상 / 수량",
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  // SizedBox(height: 4),
                  Text(
                    "18,000원",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  // SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: quantity > 1 ? () => onQuantityChanged(quantity - 1) : null,
                      ),
                      Text("$quantity"),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => onQuantityChanged(quantity + 1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
