// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vetrine_pet/models/cart.dart';
import 'package:vetrine_pet/models/produto.dart';

class CartController extends ValueNotifier<List<CartItem>> {
  CartController() : super([]);
  final List<CartItem> cartItems = [];
  void addToCart(Produtos produtos, int quantity) {
    final existItemIndex =
        value.indexWhere((item) => item.produto.id == produtos.id);

    if (existItemIndex != -1) {
      value = value.map((item) {
        if (item.produto.id == produtos.id) {
          return CartItem(
              quantity: item.quantity + quantity, produto: item.produto);
        }
        return item;
      }).toList();
    } else {
      value = [...value, CartItem(quantity: quantity, produto: produtos)];
    }
  }
}
