import 'package:flutter/material.dart';
import 'widget/zia_add_buttom.dart';
import 'widget/zia_add_buttom_editable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: ZiaAddButtom(
                onChangeValue: (value){
                    print(value);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: ZiaAddButtomEditable(
                onChangeValue: (value){
                    print(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
