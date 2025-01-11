import 'dart:convert';

class Produto {
  int id;
  String name;
  String description;
  String image;
  double price;
  bool isFavorite = false;

  Produto({
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

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) =>
      Produto.fromMap(json.decode(source) as Map<String, dynamic>);

  Produto copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    double? price,
    int? quantity,
    bool? isFavorite,
  }) {
    return Produto(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
