import 'package:flutter/material.dart';
import 'package:matching_game/games.dart';

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Games())),
          child: Container(
            child: Text("oke"),
          ),
        ),
      ),
    );
  }
}
