import 'package:flutter/material.dart';
import '../design/primeNumberWidgetStyle.dart';

class PrimeNumberWidget extends StatelessWidget {
  final int prime;
  final Duration timeSinceLast;

  const PrimeNumberWidget({
    super.key,
    required this.prime,
    required this.timeSinceLast,
  });

  String formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = d.inSeconds % 60;
    return '${minutes}m ${seconds}s';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: PrimeNumberWidgetStyle.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double dialogWidth =
              constraints.maxWidth > 400 ? 400 : constraints.maxWidth;
          return SizedBox(
            width: dialogWidth,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 6,
                      decoration: PrimeNumberWidgetStyle.handleDecoration,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Congrats!', style: PrimeNumberWidgetStyle.titleStyle),
                  const SizedBox(height: 12),
                  Text(
                    'You obtained a prime number, it was: $prime',
                    style: PrimeNumberWidgetStyle.bodyStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Time since last prime number: ${formatDuration(timeSinceLast)}',
                    style: PrimeNumberWidgetStyle.subtitleStyle,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: PrimeNumberWidgetStyle.buttonStyle,
                      child: Text(
                        'Close',
                        style: PrimeNumberWidgetStyle.buttonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
