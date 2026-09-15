// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/match_record.dart';
import 'package:to_dont_list/widgets/match_list_item.dart';
import 'package:to_dont_list/widgets/match_dialog.dart';

class MatchList extends StatefulWidget {
  const MatchList({super.key});

  @override
  State createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  final List<MatchRecord> matches = [];

  void _handleNewMatch(MatchRecord record) {
  setState(() {
    matches.insert(0, record);
  });
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('League Tracker'),
    ),
    body: ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: matches.map((record) {
        return MatchListItem(record: record);
      }).toList(),
    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return MatchDialog(onMatchAdded: _handleNewMatch);
          },
        );
      },
    ),
  );
}
}

void main() {
  runApp(const MaterialApp(
    title: 'League Tracker',
    home: MatchList(),
  ));
}
