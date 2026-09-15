// Data class to keep track of a single logged match.

enum Role { top, jungle, mid, adc, support }

class MatchRecord {
  const MatchRecord({
    required this.champion,
    required this.role,
    required this.kills,
    required this.deaths,
    required this.assists,
    required this.cs,
    required this.gameLength,
    required this.won,
    required this.date,
  });

  final String champion;
  final Role role;
  final int kills;
  final int deaths;
  final int assists;
  final int cs;
  final int gameLength;
  final bool won;
  final DateTime date;
}