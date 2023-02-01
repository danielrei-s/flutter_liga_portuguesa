import 'dart:developer';

import 'package:flutter/material.dart';

class Transfer {
  final String team;
  final String league;
  final DateTime transferDate;

  Transfer({
    required this.team,
    required this.league,
    required this.transferDate,
  });

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

List<Transfer> transfer = [
  Transfer(
    team: "Sbording",
    league: "LP",
    transferDate: DateTime.now(),
  ),
  Transfer(
    team: "Benfas",
    league: "LP",
    transferDate: DateTime.now(),
  ),
];
