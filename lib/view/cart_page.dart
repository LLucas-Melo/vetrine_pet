import 'package:flutter/material.dart';
import 'package:vetrine_pet/controller/cart_controller.dart';

import 'package:vetrine_pet/view/states/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
    required this.cartController,
  });

  final CartController cartController;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Carrinho de compras (${widget.cartController.cartItems.length}).'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              widget.cartController.cleanCart();
              setState(() {});
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<CartState>(
            valueListenable: widget.cartController,
            builder: (context, value, child) {
              if (value is CartStateSuccess) {
                return ListView.builder(
                    itemCount: value.cartProducts.length,
                    itemBuilder: (context, index) {
                      final product = value.cartProducts[index];
                      return Container(
                          height: 200,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            Text(product.produto.name),
                            Text(product.produto.price.toString()),
                            Text(product.quantity.toString()),
                            IconButton(
                                onPressed: () {
                                  widget.cartController
                                      .decreaseQuantity(product);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.remove)),
                            IconButton(
                                onPressed: () {
                                  widget.cartController
                                      .increaseQuantity(product);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.add))
                          ]));
                    });
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
