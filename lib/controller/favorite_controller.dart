import 'package:flutter/material.dart';
import 'package:vetrine_pet/models/produto.dart';
import 'package:vetrine_pet/view/states/favorite_state.dart';

class FavoriteController extends ValueNotifier<FavoriteState> {
  FavoriteController() : super(FavoriteStateInitial());
  final List<Produto> _favoriteProducts = [];

  toggleFavorite(Produto product) {
    value = FavoriteStateLoading();

    if (product.isFavorite) {
      _favoriteProducts.add(product);
    } else {
      _favoriteProducts.removeWhere((item) => item.id == product.id);
    }
    value = FavoriteStateSuccess(products: _favoriteProducts);
  }

  List<Produto> get favoriteProdutos => _favoriteProducts;
}
