import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:to_dont_list/main.dart';
import 'package:to_dont_list/objects/match_record.dart';
import 'package:to_dont_list/widgets/match_list_item.dart';

void main() {
  test('MatchRecord kda combines kills, deaths, and assists', () {
    final record = MatchRecord(
      champion: 'Ahri',
      role: Role.top,
      kills: 6,
      deaths: 8,
      assists: 0,
      cs: 64,
      gameLength: 30,
      won: true,
      date: DateTime(2026, 9, 15),
    );

    expect(record.kda, '6/8/0');
  });
}