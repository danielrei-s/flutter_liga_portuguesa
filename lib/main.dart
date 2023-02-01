import 'package:flutter/material.dart';
import 'package:flutter_liga_portuguesa/team.dart';
import 'package:flutter_liga_portuguesa/comp.dart';
import 'package:flutter_liga_portuguesa/competitionpage.dart';
import 'package:flutter_liga_portuguesa/player.dart';

void main() {
  final competitions = [
    Competition(name: "Premier League", teams: [
      Team(name: "Liverpool", players: [
        Player(name: "Salah"),
        Player(name: "Mane"),
        Player(name: "Firmino"),
      ]),
      Team(name: "Man City", players: [
        Player(name: "Sterling"),
        Player(name: "Aguero"),
        Player(name: "De Bruyne"),
      ]),
    ]),
    Competition(name: "La Liga", teams: [
      Team(name: "Barcelona", players: [
        Player(name: "Messi"),
        Player(name: "Griezmann"),
        Player(name: "Dembele"),
      ]),
      Team(name: "Real Madrid", players: [
        Player(name: "Benzema"),
        Player(name: "Hazard"),
        Player(name: "Modric"),
      ]),
    ]),
  ];

  runApp(MyApp(competitions: competitions));
}

class HomePage extends StatefulWidget {
  final List<Competition> competitions;
  HomePage({required this.competitions});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late List<Competition> _competitions;
  @override
  void initState() {
    _competitions = widget.competitions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _competitions.length,
              itemBuilder: (BuildContext context, int index) {
                return CompetitionCard(competition: _competitions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  List<Competition> _competitions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _competitions.length,
              itemBuilder: (BuildContext context, int index) {
                return CompetitionCard(competition: _competitions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<Competition> competitions;
  MyApp({required this.competitions});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(competitions: competitions),
    );
  }
}

class sHomePageState extends State<HomePage> {
  List<Competition> competitions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Football App"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: competitions.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(competitions[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompetitionPage(competition: competitions[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            child: Text("Add Competition"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddEditCompetitionPage(competition: competitions[0]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CompetitionCard extends StatelessWidget {
  final Competition competition;

  CompetitionCard({required this.competition});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(competition.name),
            subtitle: Text("${competition.teams.length} teams"),
          ),
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                child: Text("Details"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CompetitionPage(competition: competition),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text("Edit"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddEditCompetitionPage(competition: competition),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddEditCompetitionPage extends StatefulWidget {
  final Competition competition;
  AddEditCompetitionPage({required this.competition});
  @override
  _AddEditCompetitionPageState createState() => _AddEditCompetitionPageState();
}

class _AddEditCompetitionPageState extends State<AddEditCompetitionPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  final _nameController = TextEditingController();

  @override
  void initState() {
    if (widget.competition != null) {
      _nameController.text = widget.competition.name;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.competition == null
            ? "Add Competition"
            : "Edit Competition"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text(widget.competition == null ? "Add" : "Save"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.competition == null) {
                      // Add new competition
                      // Add logic here to add new competition to the list
                      // ex: competitions.add(Competition(name: _name));
                    } else {
                      // Update existing competition
                      // Add logic here to update the existing competition in the list
                      // ex: widget.competition.name = _name;
                    }
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
