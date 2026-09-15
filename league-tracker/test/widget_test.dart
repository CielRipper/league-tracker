import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:to_dont_list/main.dart';
import 'package:to_dont_list/objects/match_record.dart';
import 'package:to_dont_list/widgets/match_list_item.dart';

void main() {
  test('MatchRecord kda combines kills, deaths, and assists', () {
    final record = MatchRecord(
      champion: 'Ahri',
      role: Role.mid,
      kills: 6,
      deaths: 8,
      assists: 0,
      cs: 170,
      gameLength: 30,
      won: true,
      date: DateTime(2026, 9, 15),
    );

    expect(record.kda, '6/8/0');
  });

test('MatchRecord stores champion, role, and result correctly', () {
  final record = MatchRecord(
    champion: 'Renekton',
    role: Role.jungle,
    kills: 2,
    deaths: 3,
    assists: 10,
    cs: 120,
    gameLength: 25,
    won: false,
    date: DateTime(2026, 9, 1),
  );

  expect(record.champion, 'Renekton');
  expect(record.role, Role.jungle);
  expect(record.won, false);
});

test('MatchRecord kda handles an all-zero game', () {
  final record = MatchRecord(
    champion: 'Jinx',
    role: Role.adc,
    kills: 0,
    deaths: 0,
    assists: 0,
    cs: 0,
    gameLength: 0,
    won: false,
    date: DateTime(2026, 9, 1),
  );

  expect(record.kda, '0/0/0');
});

testWidgets('MatchListItem displays the champion name', (tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: MatchListItem(
        record: MatchRecord(
          champion: 'Ahri',
          role: Role.mid,
          kills: 6,
          deaths: 8,
          assists: 0,
          cs: 170,
          gameLength: 30,
          won: true,
          date: DateTime(2026, 9, 15),
        ),
      ),
    ),
  ));

  final championFinder = find.text('Ahri');
  expect(championFinder, findsOneWidget);
});

testWidgets('MatchListItem displays the role', (tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: MatchListItem(
        record: MatchRecord(
          champion: 'Ahri',
          role: Role.mid,
          kills: 6,
          deaths: 8,
          assists: 0,
          cs: 170,
          gameLength: 30,
          won: true,
          date: DateTime(2026, 9, 15),
        ),
      ),
    ),
  ));

  final roleFinder = find.text('mid');
  expect(roleFinder, findsOneWidget);
});

testWidgets('MatchListItem displays Win for a won match', (tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: MatchListItem(
        record: MatchRecord(
          champion: 'Ahri',
          role: Role.mid,
          kills: 6,
          deaths: 8,
          assists: 0,
          cs: 170,
          gameLength: 30,
          won: true,
          date: DateTime(2026, 9, 15),
        ),
      ),
    ),
  ));

  final winFinder = find.text('Result: Win');
  expect(winFinder, findsOneWidget);
});

testWidgets('MatchListItem uses green tileColor for a win', (tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: MatchListItem(
        record: MatchRecord(
          champion: 'Ahri',
          role: Role.mid,
          kills: 6,
          deaths: 8,
          assists: 0,
          cs: 170,
          gameLength: 30,
          won: true,
          date: DateTime(2026, 9, 15),
        ),
      ),
    ),
  ));

  final tile = tester.widget<ListTile>(find.byType(ListTile));
  expect(tile.tileColor, Colors.green[100]);
});

testWidgets('MatchListItem uses red tileColor for a loss', (tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: MatchListItem(
        record: MatchRecord(
          champion: 'Ahri',
          role: Role.mid,
          kills: 6,
          deaths: 8,
          assists: 0,
          cs: 170,
          gameLength: 30,
          won: false,
          date: DateTime(2026, 9, 15),
        ),
      ),
    ),
  ));

  final tile = tester.widget<ListTile>(find.byType(ListTile));
  expect(tile.tileColor, Colors.red[100]);
});

}