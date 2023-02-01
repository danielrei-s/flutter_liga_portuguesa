import 'package:flutter_liga_portuguesa/player.dart';
import 'package:collection/collection.dart';
import 'package:flutter_liga_portuguesa/team.dart';
import 'package:meta/meta.dart';

class Competition {
  final String name;
  final List<Team> teams;
  Competition({required this.name, required this.teams});
}
