class Product {
  final int id;
  final String title;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}


final List<Product> products = [
  Product(
    id: 1,
    title: "Cotton T-Shirt",
    imageUrl:
        "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=300&h=300&fit=crop",
    price: 19.99,
  ),
  Product(
    id: 2,
    title: "Blue Jeans",
    imageUrl:
        "https://images.unsplash.com/photo-1542272604-787c3835535d?w=300&h=300&fit=crop",
    price: 49.99,
  ),
  Product(
    id: 3,
    title: "Summer Dress",
    imageUrl:
        "https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=300&h=300&fit=crop",
    price: 39.99,
  ),
  Product(
    id: 4,
    title: "Leather Jacket",
    imageUrl:
        "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=300&h=300&fit=crop",
    price: 149.99,
  ),
  Product(
    id: 5,
    title: "Sneakers",
    imageUrl:
        "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=300&h=300&fit=crop",
    price: 79.99,
  ),
  Product(
    id: 6,
    title: "Handbag",
    imageUrl:
        "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=300&h=300&fit=crop",
    price: 89.99,
  ),
];
