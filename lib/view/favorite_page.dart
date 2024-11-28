// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../controller/favorite_controller.dart';
import '../models/produto.dart';
import '../widgets/card_produto.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    super.key,
    required this.controller,
  });
  final FavoriteController controller;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoritos = List<Produtos>.from(
        ModalRoute.of(context)!.settings.arguments as List<Produtos>);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: favoritos.isEmpty
          ? const Center(child: Text('Sem favoritos'))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder<List<Produtos>>(
                valueListenable: widget.controller,
                builder: (context, _, child) {
                  return ListView.builder(
                    itemCount: favoritos.length,
                    itemBuilder: (context, index) {
                      final produto = favoritos[index];
                      return CardProduto(
                        description: produto.description,
                        image: produto.image,
                        productName: produto.name,
                        price: produto.price,
                        isFavorite: produto.isFavorite,
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
