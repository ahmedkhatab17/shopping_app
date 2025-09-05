import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../utils/app_styles.dart';
import '../widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  final Function(Locale) onLanguageChanged;

  const SignUpScreen({super.key, required this.onLanguageChanged});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.signUp,
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  l10n.createYourAccount,
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
                  l10n.joinUs,
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 16,
                    color: AppStyles.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                _buildTextField(
                  controller: _name,
                  label: l10n.fullName,
                  icon: Icons.person,
                  validator: validateName,
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(height: 16),

                _buildTextField(
                  controller: _email,
                  label: l10n.email,
                  icon: Icons.email,
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),

                _buildTextField(
                  controller: _password,
                  label: l10n.password,
                  icon: Icons.lock,
                  validator: validatePassword,
                  isPassword: true,
                ),
                SizedBox(height: 16),

                _buildTextField(
                  controller: _confirmPassword,
                  label: l10n.confirmPassword,
                  icon: Icons.lock_outline,
                  validator: (value) =>
                      validateConfirmPassword(value, _password.text),
                  isPassword: true,
                ),
                SizedBox(height: 32),
                CustomButton(
                  text: _isLoading ? "Creating Account..." : l10n.createAccount,
                  onPressed: _isLoading ? null : _handleSignUp,
                  isPrimary: true,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.alreadyHaveAccount,
                      style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: AppStyles.secondaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/signin'),
                      child: Text(
                        l10n.signIn,
                        style: TextStyle(
                          fontFamily: 'Suwannaphum',
                          fontWeight: FontWeight.bold,
                          color: AppStyles.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String? Function(String?) validator,
    bool isPassword = false,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        style: TextStyle(fontFamily: 'Suwannaphum', fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppStyles.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(
            fontFamily: 'Suwannaphum',
            color: AppStyles.secondaryColor,
          ),
        ),
        validator: validator,
      ),
    );
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(milliseconds: 200));
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
