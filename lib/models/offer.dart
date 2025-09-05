class Offer {
  final int id;
  final String description;
  final String imageUrl;

  Offer({required this.id, required this.description, required this.imageUrl});
}


final List<Offer> offers = [
  Offer(
    id: 1,
    description: "Summer Sale - 30% off",
    imageUrl:
        "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=200&fit=crop",
  ),
  Offer(
    id: 2,
    description: "Buy 2 Get 1 Free",
    imageUrl:
        "https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=400&h=200&fit=crop",
  ),
  Offer(
    id: 3,
    description: "Jeans Special - 20% off",
    imageUrl:
        "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=400&h=200&fit=crop",
  ),
];
