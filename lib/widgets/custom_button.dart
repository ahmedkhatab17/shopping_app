import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isPrimary = true,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? AppStyles.primaryColor
              : Colors.transparent,
          foregroundColor: isPrimary ? Colors.white : AppStyles.primaryColor,
          side: BorderSide(color: AppStyles.primaryColor, width: 2),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: isPrimary ? 4 : 0,
          shadowColor: AppStyles.primaryColor.withOpacity(0.3),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
