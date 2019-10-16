import 'package:flutter/material.dart';

class TesteDiscordPage extends StatefulWidget {
  final Image image;

  const TesteDiscordPage(this.image, {Key key}) : super(key: key);
  @override
  _TesteDiscordPageState createState() => _TesteDiscordPageState(image);
}

class _TesteDiscordPageState extends State<TesteDiscordPage> {
  final Image image;

  _TesteDiscordPageState(this.image);

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
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: image,
          ),
          Column(
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
        ],
      ),
    );
  }
}
