class Product {
  int id;
  String title;
  String image;
  double price;
  String description;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });
}

class CartItem {
  Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}