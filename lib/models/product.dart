class Product {
  int id;
  String title;
  String image;
  double price;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price
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