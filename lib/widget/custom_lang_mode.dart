import 'package:flutter/material.dart';

class CustomLangButton extends StatelessWidget {
  final String text;
  final bool isArabic;
  final bool mode;
  const CustomLangButton({super.key, required this.text, required this.isArabic, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: mode ?const Color(0xffe8e8e8) : Colors.black,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.all(2),
      child:  isArabic ?Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 5,),
          Text(
            "$text ",
            style:  TextStyle(
                color: mode ? Colors.black : Colors.white,
                fontFamily: 'Cairo',
                fontSize: 13,
                fontWeight: FontWeight.normal
            ),
          ),
          const SizedBox(width: 5,),
           CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 15,
            child: Image.asset(
                'assets/image/ar_icon.png',
              width: 24,
              height: 24,
              color: Colors.black,
            ),
          ),
        ],
      ) :Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 15,
            child: Image.asset(
              'assets/image/en_icon.png',
              width: 30,
              height: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 5,),
          Text(
            text,
            style:  TextStyle(
                color: mode ? Colors.black : Colors.white,
                fontFamily: 'Cairo',
                fontSize: 13,
                fontWeight: FontWeight.normal
            ),
          ),
          const SizedBox(width: 5,),

        ],
      ),
    );
  }
}
