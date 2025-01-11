import 'package:flutter/material.dart';
import 'package:vetrine_pet/controller/cart_controller.dart';
import 'package:vetrine_pet/controller/favorite_controller.dart';
import 'package:vetrine_pet/controller/home_page_controller.dart';

import '../widgets/card_produto.dart';
import 'states/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.favoriteController,
      required this.controller,
      required this.cartController});

  @override
  State<HomePage> createState() => _HomePageState();

  final FavoriteController favoriteController;
  final HomePageController controller;
  final CartController cartController;
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.controller.getProducts();
    widget.favoriteController.favoriteProdutos;
    widget.cartController.cartItems;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.controller.getProducts();
    widget.favoriteController.favoriteProdutos;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Image(
                image: AssetImage('lib/assets/images/logo.png'),
                height: 40,
              ),
            ),
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      print(widget.favoriteController.value);
                      Navigator.pushNamed(
                        context,
                        arguments: widget.favoriteController.value,
                        '/favorite',
                      );
                    },
                  ),
                  IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          arguments: widget.cartController.value,
                          '/cart',
                        );
                      }),
                ],
              )
            ],
          ),
          drawer: const Drawer(
            backgroundColor: Color.fromARGB(
              255,
              195,
              94,
              219,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder<HomeState>(
              valueListenable: widget.controller,
              builder: (context, value, child) {
                return value is HomeStateError
                    ? const Center(
                        child: Text("Error"),
                      )
                    : value is HomeStateLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : value is HomeStateSuccess
                            ? ListView.builder(
                                itemCount: value.products.length,
                                itemBuilder: (context, index) {
                                  final product = value.products[index];
                                  return CardProduto(
                                      image: product.image,
                                      productName: product.name,
                                      description: product.description,
                                      price: product.price,
                                      isFavorite: product.isFavorite,
                                      onPressed: () {
                                        widget.cartController
                                            .addToCart(product, 1);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Center(
                                                child: Text(
                                                    '${product.name} adicionado ao carrinho')),
                                          ),
                                        );
                                      },
                                      toggleFavorite: () {
                                        setState(() {
                                          product.isFavorite =
                                              !product.isFavorite;
                                          widget.favoriteController
                                              .toggleFavorite(product);
                                        });
                                      });
                                })
                            : const Center(child: Text("Nenhum produto"));
              },
            ),
          )),
    );
  }
}
