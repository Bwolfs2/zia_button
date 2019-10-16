import 'package:flutter/material.dart';
import 'package:zia_button/app/teste_discord/teste_discord_page.dart';

class IntermediatedPage extends StatefulWidget {
  @override
  _IntermediatedPageState createState() => _IntermediatedPageState();
}

class _IntermediatedPageState extends State<IntermediatedPage> {
  Image myImage;

  @override
  void initState() {
    super.initState();
    myImage = Image.asset(
      "assets/background.jpg",
      fit: BoxFit.fill,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intermediated"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("BAi"),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_){
                    return TesteDiscordPage(myImage);
                }
              ));
            },
          )
        ],
      ),
    );
  }
}
