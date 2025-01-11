// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vetrine_pet/models/cart.dart';
import 'package:vetrine_pet/models/produto.dart';
import 'package:vetrine_pet/view/states/cart_state.dart';

class CartController extends ValueNotifier<CartState> {
  CartController() : super(CartStateInicial());
  List<CartItem> cartItems = [];
  void addToCart(Produto products, int quantity) {
    value = CartStateLoading();

    final existItemIndex =
        cartItems.indexWhere((item) => item.produto.id == products.id);
    value = CartStateSuccess(cartItems);

    if (existItemIndex != -1) {
      cartItems = cartItems.map((item) {
        if (item.produto.id == products.id) {
          return CartItem(
              quantity: item.quantity + quantity, produto: item.produto);
        }
        return item;
      }).toList();
    } else {
      cartItems.add(CartItem(produto: products, quantity: quantity));
    }
    value = CartStateSuccess(cartItems);
  }

  void increaseQuantity(CartItem cartItem) {
    final index =
        cartItems.indexWhere((item) => item.produto.id == cartItem.produto.id);

    if (index == -1) return;
    cartItems[index] =
        CartItem(produto: cartItem.produto, quantity: cartItem.quantity + 1);

    value = CartStateSuccess(cartItems);
  }

  void decreaseQuantity(CartItem cartItem) {
    final index =
        cartItems.indexWhere((item) => item.produto.id == cartItem.produto.id);

    if (index == -1) return;
    if (cartItem.quantity == 1) {
      cartItems.removeAt(index);
    } else {
      cartItems[index] =
          CartItem(produto: cartItem.produto, quantity: cartItem.quantity - 1);
      value = CartStateSuccess(cartItems);
    }

    value = CartStateSuccess(cartItems);
  }

  double getTotalPrice() {
    return cartItems.fold(
        0.0, (total, item) => total + (item.produto.price * item.quantity));
  }

  void cleanCart() {
    cartItems.clear();

    value = CartStateSuccess(cartItems);
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    value = CartStateSuccess(cartItems);
  }

  quantityCartItems() {
    return cartItems.length;
  }
}
