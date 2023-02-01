import 'package:flutter_liga_portuguesa/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_liga_portuguesa/comp.dart';
import 'package:flutter_liga_portuguesa/player.dart';

class TeamPage extends StatelessWidget {
  final Team team;

  TeamPage({required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: team.players.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(team.players[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
