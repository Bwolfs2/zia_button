import 'package:flutter/material.dart';

class TesteDiscordPage extends StatefulWidget {
  @override
  _TesteDiscordPageState createState() => _TesteDiscordPageState();
}

class _TesteDiscordPageState extends State<TesteDiscordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("TesteDiscord"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0068B1),
                  Color(0xff0078C1),
                  Color(0xff008CD7),
                ],
              ),
            ),
          ),),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text("casa"),
                  // Spacer(),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
