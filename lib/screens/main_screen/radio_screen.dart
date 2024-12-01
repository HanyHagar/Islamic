import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/Cubit/statues.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
          if (state is FailedRadioState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                state.error,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        }
          else if (appCubit.radioChannels.isNotEmpty) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(flex: 2),
                Image.asset(
                  'assets/image/radio.png',
                  height: 227,
                  width: double.infinity,
                ),
                const Spacer(flex: 1),
                Text(
                  appCubit.radioChannels[appCubit.currentChanelRadio].name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        appCubit.radioFunctions('previous');
                      },
                      icon: Icon(
                        Icons.skip_previous,
                        size: 24,
                        color: appCubit.isLight
                            ? const Color(0xffB7935F)
                            : const Color(0xffFACC1D),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        appCubit.radioFunctions('play');
                      },
                      icon: Icon(
                        appCubit.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 32,
                        color: appCubit.isLight
                            ? const Color(0xffB7935F)
                            : const Color(0xffFACC1D),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        appCubit.radioFunctions('next');
                      },
                      icon: Icon(
                        Icons.skip_next,
                        size: 24,
                        color: appCubit.isLight
                            ? const Color(0xffB7935F)
                            : const Color(0xffFACC1D),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
          );
        }
          else {
            return const Center(child: CircularProgressIndicator());
          }
      },
      listener: (context, state) {},
    );
  }
}
