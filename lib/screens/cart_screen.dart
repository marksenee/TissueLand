import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
      ),
      body: const Center(
        child: Text('장바구니 페이지'),
      ),
    );
  }
}
