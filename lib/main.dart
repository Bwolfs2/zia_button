import 'package:camera_camera/page/camera.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zia_button/app/teste_discord/teste_discord_bloc.dart';
import 'package:zia_button/app/teste_discord/teste_discord_page.dart';
import 'app/teste_bloc.dart';
import 'app/teste_discord/intermediated/intermediated_page.dart';
import 'drawer_ane.dart';
import 'widget/zia_add_buttom.dart';
import 'widget/zia_add_buttom_editable.dart';


void main() {
  runApp(MyApp());
  //SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff50000000),
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: IntermediatedPage(),
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
  TesteBloc bloc = TesteBloc();
  var controller = TextEditingController();
  var controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
       
        title: Text("Teste",),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 200,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.book,
                color: Colors.yellow,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      drawer: Drawer(child: CustomDrawer()),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              StreamBuilder<int>(
                  stream: bloc.testeStream,
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Container(color: Colors.blueAccent)
                        : Container(
                            child: Text("${snapshot.data}"),
                          );
                  }),
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: "Refreshing?"),
              ),
              TextField(
                controller: controller2,
                decoration: InputDecoration(labelText: "Refreshing?2"),
              ),
              FindDropdown(
                  items: ["Brasil", "Itália", "Estados Unidos", "Canadá"],
                  label: "País",
                  onChanged: (String item) => print(item),
                  selectedItem: "Brasil",
                  dropdownBuilder: (_, data) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(data?.toString() ?? ""),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.search,
                              size: 25,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              RaisedButton(
                onPressed: () async {
                  var file = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Camera(imageMask: CircleAvatar())));
                },
                child: Text("Camera Camera"),
              ),
              Container(
                width: 200,
                child: ZiaAddButtom(
                  onChangeValue: (value) {
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
                  onChangeValue: (value) {
                    print(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
