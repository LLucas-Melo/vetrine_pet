import 'dart:convert';

class Produtos {
  int id;
  String name;
  String description;
  String image;
  double price;
  bool isFavorite = false;

  Produtos({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.isFavorite = false,
  });

  @override
  String toString() {
    return 'Produtos(id: $id, name: $name, description: $description, image: $image, price: $price, isFavorite: $isFavorite)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'isFavorite': isFavorite,
    };
  }

  factory Produtos.fromMap(Map<String, dynamic> map) {
    return Produtos(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produtos.fromJson(String source) =>
      Produtos.fromMap(json.decode(source) as Map<String, dynamic>);

  Produtos copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    double? price,
    int? quantity,
    bool? isFavorite,
  }) {
    return Produtos(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
