class Product {
  final int id;
  final String productName;
  // final String productImage;
  final String productDescription;
  final double price;

  Product({
    required this.id,
    this.productName = 'Grapes',
    // required this.productImage,
    this.productDescription = 'This app is about grocery',
    required this.price,
  });
}
