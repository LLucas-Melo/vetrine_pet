// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vetrine_pet/view/states/favorite_state.dart';

import '../controller/favorite_controller.dart';

import '../widgets/card_produto.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    super.key,
    required this.favorite,
  });
  final FavoriteController favorite;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('favorite'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<FavoriteState>(
            valueListenable: widget.favorite,
            builder: (context, value, child) {
              if (value is FavoriteStateSuccess) {
                return ListView.builder(
                    itemCount: value.products.length,
                    itemBuilder: (context, index) {
                      final product = value.products[index];
                      return CardProduto(
                        image: product.image,
                        productName: product.name,
                        price: product.price,
                        description: product.description,
                        isFavorite: product.isFavorite,
                        toggleFavorite: () {
                          setState(() {
                            product.isFavorite = !product.isFavorite;
                          });
                          widget.favorite.toggleFavorite(product);
                        },
                      );
                    });
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
