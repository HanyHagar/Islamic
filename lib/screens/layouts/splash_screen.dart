import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/Cubit/statues.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        // This ensures the AppCubit is accessed correctly
        AppCubit appCubit = AppCubit.get(context);

        // Use WidgetsBinding to ensure the context is valid for navigation
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Future.delayed(
            const Duration(seconds: 3),
                () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
            },
          );
        });

        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  appCubit.isLight ? 'assets/image/bg2.png' : 'assets/image/bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Image.asset(
                  appCubit.isLight ? 'assets/image/logo2.png' : 'assets/image/logo1.png',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
