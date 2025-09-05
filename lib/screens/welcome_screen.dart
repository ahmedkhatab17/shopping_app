import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import '../widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  final Function(Locale) onLanguageChanged;

  const WelcomeScreen({super.key, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.appTitle,
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
                onLanguageChanged(const Locale('ar', ''));
              } else {
                onLanguageChanged(const Locale('en', ''));
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'en',
                child: Row(children: [Text('English')]),
              ),
              PopupMenuItem<String>(
                value: 'ar',
                child: Row(children: [Text('العربية')]),
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
            colors: [AppStyles.primaryColor.withOpacity(0.1), Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.welcomeToStore,
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppStyles.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  l10n.discoverProducts,
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 16,
                    color: AppStyles.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=300&h=300&fit=crop',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),
                CustomButton(
                  text: l10n.signUp,
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  isPrimary: true,
                ),
                SizedBox(height: 16),
                CustomButton(
                  text: l10n.signIn,
                  onPressed: () => Navigator.pushNamed(context, '/signin'),
                  isPrimary: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
