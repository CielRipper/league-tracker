import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/match_record.dart';

typedef MatchListAddedCallback = Function(MatchRecord record);

class MatchDialog extends StatefulWidget {
  const MatchDialog({
    super.key,
    required this.onMatchAdded,
  });

  final MatchListAddedCallback onMatchAdded;

  @override
  State<MatchDialog> createState() => _MatchDialogState();
}

class _MatchDialogState extends State<MatchDialog> {
  final TextEditingController _championController = TextEditingController();
  Role _selectedRole = Role.top;
  final TextEditingController _killsController = TextEditingController();
  final TextEditingController _deathsController = TextEditingController();
  final TextEditingController _assistsController = TextEditingController();
  final TextEditingController _csController = TextEditingController();
  final TextEditingController _gameLengthController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _won = true;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}