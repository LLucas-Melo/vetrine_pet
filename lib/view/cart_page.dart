import 'package:flutter/material.dart';
import 'package:vetrine_pet/controller/cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required CartController controller});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de compras'),
      ),
    );
  }
}
