class Product {
  final String id;
  final String name;
  final String type;
  final String image;
  final List<String>? allergenes;
  final int weight;
  final int price;

  const Product(
      {required this.id,
      required this.name,
      required this.type,
      required this.image,
      required this.weight,
      required this.price,
      this.allergenes = const []});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      image: json['image'] as String,
      allergenes: json['allergens'] != null
          ? json['allergens'] as List<String>
          : json['allergens'] as Null,
      weight: json['weight'] as int,
      price: json['price'] as int,
    );
  }
}
