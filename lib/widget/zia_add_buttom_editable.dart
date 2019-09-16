import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ZiaAddButtomEditable extends StatefulWidget {
  final Function(int) onChangeValue;

  const ZiaAddButtomEditable({Key key, this.onChangeValue}) : super(key: key);
  @override
  _ZiaAddButtomEditableState createState() => _ZiaAddButtomEditableState();
}

class _ZiaAddButtomEditableState extends State<ZiaAddButtomEditable> {
  var qtdValue = 0;

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff607D8B),
      child: qtdValue == 0
          ? InkWell(
              onTap: () {
                setState(() {
                  qtdValue = ++qtdValue;
                  textController.text = "$qtdValue";
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
                        textController.text = "$qtdValue";
                        widget.onChangeValue(qtdValue);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 100,
                    color: Colors.white,
                    child: Center(
                        child: CupertinoTextField(
                      textAlign: TextAlign.center,
                      controller: textController,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(12),
                        WhitelistingTextInputFormatter.digitsOnly,
                        BlacklistingTextInputFormatter.singleLineFormatter,
                      ],
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                        signed: false,
                      ),
                      onChanged: (value) {
                        if (value == "") {                        
                            qtdValue = 0;                         
                        } else {
                          var val = int.parse(value);
                          qtdValue = val;
                        }

                        widget.onChangeValue(qtdValue);
                      },
                      onEditingComplete: () {
                        setState(() {
                          qtdValue = qtdValue;    
                          FocusScope.of(context).requestFocus(new FocusNode());                     
                        });
                      },
                    )),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        qtdValue = ++qtdValue;
                        textController.text = "$qtdValue";
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
