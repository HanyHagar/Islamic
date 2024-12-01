import 'package:flutter/material.dart';

class CustomModeButton extends StatelessWidget {
  final String text;
  final bool mode;
  const CustomModeButton({super.key, required this.text, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: mode ? const Color(0xffe8e8e8) : Colors.black,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(2),
      child: mode
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      color:  Colors.black,
                      fontFamily: 'Cairo',
                      fontSize: 8,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 15,
                  child: Icon(
                    Icons.sunny,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 15,
                  child: Icon(
                    Icons.dark_mode,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: 8,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
    );
  }
}
