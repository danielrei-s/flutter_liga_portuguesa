import 'package:flutter_liga_portuguesa/player.dart';
import 'package:collection/collection.dart';
import 'package:flutter_liga_portuguesa/comp.dart';
import 'package:meta/meta.dart';

class Team {
  final String name;
  final List<Player> players;
  Team({required this.name, required this.players});
}
