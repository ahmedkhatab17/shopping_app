import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/app_styles.dart';
import '../widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.productDescription,
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
                height: 300,
                width: double.infinity,
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
                    product.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: AppStyles.primaryColor.withOpacity(0.1),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppStyles.primaryColor,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppStyles.primaryColor.withOpacity(0.1),
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 80,
                            color: AppStyles.primaryColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppStyles.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'EGP ${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      l10n.productDescription,
                      style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppStyles.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "High-quality fashion item with great value. Made with quality materials and designed for style and comfort.",
                      style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 16,
                        color: AppStyles.secondaryColor,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      l10n.keyFeatures,
                      style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppStyles.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 20),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Quality materials",
                            style: TextStyle(
                              fontFamily: 'Suwannaphum',
                              fontSize: 16,
                              color: AppStyles.secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 20),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Comfortable fit",
                            style: TextStyle(
                              fontFamily: 'Suwannaphum',
                              fontSize: 16,
                              color: AppStyles.secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    CustomButton(
                      text: l10n.addToCart,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.title} added to cart!"),
                          ),
                        );
                      },
                      isPrimary: true,
                    ),
                    SizedBox(height: 16),
                    CustomButton(
                      text: l10n.buyNow,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Buy now feature coming soon!"),
                          ),
                        );
                      },
                      isPrimary: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
