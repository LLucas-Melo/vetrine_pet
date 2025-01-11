import '../../models/cart.dart';

abstract class CartState {}

class CartStateInicial extends CartState {}

class CartStateSuccess extends CartState {
  List<CartItem> cartProducts;
  CartStateSuccess(this.cartProducts);
}

class CartStateLoading extends CartState {}

class CartStateError extends CartState {
  String message;
  CartStateError(this.message);
}
