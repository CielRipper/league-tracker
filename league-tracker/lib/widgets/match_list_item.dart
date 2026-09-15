import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/match_record.dart';

class MatchListItem extends StatelessWidget {
  MatchListItem({required this.record}) : super(key: ObjectKey(record));

  final MatchRecord record;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: record.won ? Colors.green[100] : Colors.red[100],
      leading: Text(record.champion),
      title: Text(record.role.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("KDA: ${record.kda}"),
          Text("CS: ${record.cs}"),
          Text("Game Length: ${record.gameLength} minutes"),
          Text("Date: ${record.date}"),
          Text("Result: ${record.won ? "Win" : "Loss"}"),
        ],
      ),
    );
  }
}