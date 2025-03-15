import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tissue_land/screens/cart_screen.dart'; // 장바구니 페이지 추가

class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int cartItemCount = 1;
  int itemQuantity = 1;
  int itemPrice = 18000;

  // 예제 상품 이미지 리스트 (실제 구현에서는 네트워크 이미지 사용 가능)
  final List<String> productImages = [
    'https://picsum.photos/400/400?random=1',
    'https://picsum.photos/400/400?random=2',
    'https://picsum.photos/400/400?random=3',
  ];

  // 장바구니에 상품 추가하는 함수
  void _addToCart() {
    setState(() {
      cartItemCount++;
    });
  }

  // 장바구니에 상품 추가하는 함수
  void _minusToQuantity() {
    setState(() {
      itemQuantity--;
    });
  }

  void _addToQuantity() {
    setState(() {
      itemQuantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 상세 ${widget.productId}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartScreen()),
                    );
                  },
                  color: Colors.black,
                ),
                if (cartItemCount > 0)
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$cartItemCount',
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // 상품 이미지 슬라이더
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 500,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: productImages.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(productImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: productImages.length,
                          effect: const ExpandingDotsEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            activeDotColor: Colors.green,
                            dotColor: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 상품명 & 가격 (왼쪽 정렬)
                  Text(
                    '상품명',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${itemPrice}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // 하단 버튼 컨테이너
          Container(
            width: 430,
            height: 130,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color(0xFFF1F1F1), width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 장바구니 담기 버튼
                SizedBox(
                  width: 191,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: _addToCart,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF54C392)), // 테두리 색상
                      foregroundColor: Colors.black, // 텍스트 색상
                      backgroundColor: Colors.white, // 배경색
                    ),
                    child: const Text("장바구니 담기"),
                  ),
                ),

                // 구매하기 버튼
                SizedBox(
                  width: 191,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // 바텀시트를 화면 크게 띄우기 위해 필요
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => StatefulBuilder( // StatefulBuilder 추가
                          builder: (context, setModalState) { // setModalState로 모달 내부 상태 업데이트
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.4, // 화면 비율로 높이 설정
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text('상품명을 입력하세요', style: TextStyle(fontSize: 16)),
                                  const SizedBox(height: 10),
                                  Text('$itemPrice', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (itemQuantity > 1) {
                                                setModalState(() => itemQuantity--); // 모달 상태 업데이트
                                                setState(() {}); // 부모 상태도 업데이트 (필요한 경우)
                                              }
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Text('$itemQuantity', style: const TextStyle(fontSize: 18)),
                                          IconButton(
                                            onPressed: () {
                                              setModalState(() => itemQuantity++); // 모달 상태 업데이트
                                              setState(() {}); // 부모 상태도 업데이트 (필요한 경우)
                                            },
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                      Text('${itemPrice * itemQuantity}원', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context); // 바텀시트 닫기
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF54C392),
                                      ),
                                      child: const Text('구매하기', style: TextStyle(color: Colors.white, fontSize: 18)),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );

                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF54C392), // 배경색
                      foregroundColor: Colors.white, // 텍스트 색상
                    ),
                    child: const Text("구매하기"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
