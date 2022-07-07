class Product {
  final String id;
  final int price;
  final String name;
  final String type;
  final String image;
  final int weight;
  final String description;
  final List<String>? allergenes;

  const Product(
      {required this.id,
      required this.name,
      required this.type,
      required this.image,
      required this.weight,
      required this.price,
      required this.description,
      this.allergenes = const []});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      allergenes: json['allergens'] != null
          ? json['allergens'] as List<String>
          // ignore: prefer_void_to_null
          : json['allergens'] as Null,
      weight: json['weight'] as int,
      price: json['price'] as int,
    );
  }
}
