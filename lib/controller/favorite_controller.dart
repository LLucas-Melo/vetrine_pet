import 'package:flutter/material.dart';
import 'package:vetrine_pet/models/produto.dart';

class FavoriteController extends ValueNotifier<List<Produtos>> {
  List<Produtos> produtosFavoritos = [];
  List<Produtos> produtos = [];
  FavoriteController()
      : super([
          Produtos(
              id: 0,
              name: '',
              description: '',
              image: '',
              price: 0,
              isFavorite: false)
        ]);

  void toggleFavorite(Produtos produtos) {
    produtos.isFavorite = !produtos.isFavorite;

    if (produtos.isFavorite) {
      produtosFavoritos.add(produtos);
      notifyListeners();
      print(produtosFavoritos);
    } else {
      produtosFavoritos.removeWhere((item) => item.id == produtos.id);
      notifyListeners();
    }
  }
}
