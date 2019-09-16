import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ZiaAddButtom extends StatefulWidget {
  final Function(int) onChangeValue;

  const ZiaAddButtom({Key key, this.onChangeValue}) : super(key: key);
  @override
  _ZiaAddButtomState createState() => _ZiaAddButtomState();
}

class _ZiaAddButtomState extends State<ZiaAddButtom> {
  var qtdValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff607D8B),
      child: qtdValue == 0
          ? InkWell(
              onTap: () {
                setState(() {
                  qtdValue = ++qtdValue;
                  widget.onChangeValue(qtdValue);
                });
              },
              child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(13),
                    color: Color(0xff607D8B),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )
              ]))
          : Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        qtdValue = --qtdValue;
                        widget.onChangeValue(qtdValue);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Center(
                      child: Text("${qtdValue ?? ''}",
                          style: TextStyle(color: Colors.black87)),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        qtdValue = ++qtdValue;
                        widget.onChangeValue(qtdValue);
                      });
                    },
                  ),
                )
              ],
            ),
    );
  }
}
