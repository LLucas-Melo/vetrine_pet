// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vetrine_pet/models/produto.dart';

class CartItem {
  int quantity;
  final Produto produto;
  CartItem({
    required this.quantity,
    required this.produto,
  });
}
