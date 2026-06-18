import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final String message;
  final bool fullscreen;
  final double animationSize;

  const LoadingWidget({
    super.key,
    this.message = "Please wait...",
    this.fullscreen = false,
    this.animationSize = 180,
  });

  @override
  Widget build(BuildContext context) {
    final Widget content = Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [

            Lottie.asset(
              "assets/animations/loading.json",
              width: animationSize,
              height: animationSize,
              repeat: true,
            ),

            const SizedBox(height: 20),

            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 20),

            const SizedBox(
              width: 180,
              child: LinearProgressIndicator(),
            ),

          ],
        ),
      ),
    );

    if (fullscreen) {
      return Scaffold(
        body: SafeArea(
          child: content,
        ),
      );
    }

    return content;
  }
}