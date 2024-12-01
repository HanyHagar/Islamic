import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  final double wordSpacing;
  final double letterSpacing;
  final Color textColor;
  final double elevation;
  final OutlinedBorder shape;

  const CustomButton({
    this.width = 137,
    this.height = 40,
    required this.onPressed,
    required this.text,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 15,
    this.wordSpacing = 1,
    this.letterSpacing = 1,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.elevation = 2.0,
    this.shape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
    super.key,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, // Text color
          backgroundColor: color, // Button color
          elevation: elevation,
          shape: shape,
          textStyle: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            wordSpacing: wordSpacing,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
              fontFamily: fontFamily,
              color: textColor, // Ensuring text color is applied
            ),
          ),
        ),
      ),
    );
  }
}
