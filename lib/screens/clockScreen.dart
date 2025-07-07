import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:programming_challenge/design/clockScreenStyle.dart';
import 'package:programming_challenge/widgets/primeNumberWidget.dart';
import 'package:programming_challenge/logic/primeLogic.dart';
import 'package:programming_challenge/services/randomPrimeAPI.dart';
import 'package:programming_challenge/services/timeTillLastPrime.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late Timer _timer;
  late Timer _primeTimer;
  DateTime _now = DateTime.now();
  bool _showColon = true;

  DateTime _lastPrimeTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadLastPrimeTime();
    _startClock();
    _startPrimeChecker();
  }

  void _startClock() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
        _showColon = !_showColon;
      });
    });
  }

  BuildContext? _dialogContext;

  void _startPrimeChecker() {
    _primeTimer = Timer.periodic(const Duration(seconds: 10), (_) async {
      final number = await RandomPrimeAPI.fetchRandomNumber();
      if (number != null && PrimeLogic.isPrime(number)) {
        final now = DateTime.now();
        final duration = now.difference(_lastPrimeTime);
        _lastPrimeTime = now;

        await TimeTillLastPrime.saveLastPrimeTime(_lastPrimeTime);

        if (context.mounted) {
          if (_dialogContext != null) {
            Navigator.of(_dialogContext!).pop();
            _dialogContext = null;
          }

          showDialog(
            context: context,
            builder: (ctx) {
              _dialogContext = ctx;
              return PrimeNumberWidget(prime: number, timeSinceLast: duration);
            },
          ).then((_) => _dialogContext = null);
        }
      }
    });
  }

  Future<void> _loadLastPrimeTime() async {
    final loaded = await TimeTillLastPrime.loadLastPrimeTime();
    if (loaded != null) {
      setState(() {
        _lastPrimeTime = loaded;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _primeTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = DateFormat('HH').format(_now);
    final minutes = DateFormat('mm').format(_now);
    final colon = _showColon ? ':' : ' ';
    final dateString = DateFormat('E d. MMM.', 'de_DE').format(_now);
    final weekOfYear = ((int dayOfYear) =>
        ((dayOfYear - _now.weekday + 10) / 7).floor())(
      int.parse(DateFormat("D").format(_now)),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(hours, style: ClockScreenStyles.timeTextStyle),
                AnimatedOpacity(
                  opacity: _showColon ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Text(colon, style: ClockScreenStyles.timeTextStyle),
                ),
                Text(minutes, style: ClockScreenStyles.timeTextStyle),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(dateString, style: ClockScreenStyles.dateTextStyle),
                const SizedBox(width: 12),
                Text('KW $weekOfYear', style: ClockScreenStyles.weekTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
