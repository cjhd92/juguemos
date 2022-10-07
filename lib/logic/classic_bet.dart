import 'dart:math';
import 'package:flutter_application_1/logic/utils.dart';

Map<String, List<String>> l = {
  "s": ["1", "2", "3"],
  "c": ["11", "21", "31"],
};

class ClassicBet {
  late int number;
  late int fix_bet;
  late int run_bet;

  ClassicBet({
    required int number,
    required int fix_bet,
    required int run_bet,
  }) {
    this.number = clamp(number, 0, 99);
    this.fix_bet = max(fix_bet, 0);
    this.run_bet = max(run_bet, 0);
  }
}
