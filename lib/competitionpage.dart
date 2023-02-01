import 'package:flutter/material.dart';
import 'package:flutter_liga_portuguesa/comp.dart';
import 'package:flutter_liga_portuguesa/teampage.dart';

class CompetitionPage extends StatelessWidget {
  final Competition competition;

  CompetitionPage({required this.competition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(competition.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: competition.teams.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(competition.teams[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TeamPage(team: competition.teams[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
