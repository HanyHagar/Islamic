import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          error,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
