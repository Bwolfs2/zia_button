import 'package:flutter/material.dart';

class TestHome extends StatefulWidget {
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            
          });
        },
        child: Icon(Icons.refresh),
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TextCustom(
              title: "Test Const",
            ),
            TextCustomNoConst(
              title: "Teste no Const",
            )
          ],
        ),
      ),
    );
  }
}

class TextCustom extends StatelessWidget {
  final String title;

  const TextCustom({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Casa 1");
    return Text(title);
  }
}

class TextCustomNoConst extends StatelessWidget {
  final String title;

  const TextCustomNoConst({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      print("Casa 2");
    return Text(title);
  }
}
