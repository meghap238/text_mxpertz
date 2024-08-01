class CartModel {
  final String title;
  final String imageUrl;
  final String price;



  CartModel( {
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}

List<CartModel> cartData = [
  CartModel(
    imageUrl: 'assets/image/CartMakeup.png',
    title: "Multi Kit",
    price: '\$400',
  ),
  CartModel(
    imageUrl: 'assets/image/lipstik.png',
    title: "Lipstick",
    price: '\$500',
  ),


];
