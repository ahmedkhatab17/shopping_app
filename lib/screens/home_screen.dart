import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/offer_item.dart';
import '../models/product.dart';
import '../models/offer.dart';
import '../utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLanguageChanged;

  const HomeScreen({super.key, required this.onLanguageChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Product> cartItems = [];

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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.ourProducts,
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppStyles.primaryColor,
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.language, color: Colors.white),
            onSelected: (String language) {
              if (language == 'ar') {
                widget.onLanguageChanged(const Locale('ar', ''));
              } else {
                widget.onLanguageChanged(const Locale('en', ''));
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(value: 'en', child: Text('English')),
              PopupMenuItem<String>(value: 'ar', child: Text('العربية')),
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Cart has ${cartItems.length} items"),
                    ),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '${cartItems.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppStyles.primaryColor.withOpacity(0.05), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 260,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              products[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          products.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 20 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  l10n.featuredProducts,
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppStyles.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (ctx, i) => ProductCard(
                  product: products[i],
                  onAddToCart: () {
                    setState(() {
                      cartItems.add(products[i]);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${products[i].title} added to cart!"),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  l10n.hotOffers,
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppStyles.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: offers.length,
                  itemBuilder: (ctx, i) => Container(
                    width: 300,
                    margin: EdgeInsets.only(right: 16),
                    child: OfferItem(offer: offers[i]),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
