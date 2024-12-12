import 'package:flutter/material.dart';

class CardProduto extends StatefulWidget {
  const CardProduto(
      {super.key,
      required this.image,
      required this.productName,
      required this.description,
      this.isFavorite,
      required this.price,
      this.onPressed,
      this.toggleFavorite,
      this.inCart});

  final String image;
  final String productName;
  final String description;
  final double price;
  final bool? isFavorite;
  final bool? inCart;
  final void Function()? onPressed;
  final void Function()? toggleFavorite;

  @override
  State<CardProduto> createState() => _CardProdutoState();
}

class _CardProdutoState extends State<CardProduto> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Card(
        elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: widget.toggleFavorite,
                  child: Icon(
                    widget.isFavorite ?? false
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: widget.onPressed,
                  child: Icon(
                    widget.inCart ?? false
                        ? Icons.remove_shopping_cart
                        : Icons.add_shopping_cart,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: Image.network(
                widget.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              children: [
                Text(
                  widget.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'R\$ ${widget.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: widget.onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Comprar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
