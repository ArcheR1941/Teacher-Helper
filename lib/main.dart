import 'package:flutter/material.dart';
import 'dart:math';

void main () => runApp(RandomSelector());
class RandomSelector extends StatelessWidget {
  @override
  Widget build (BuildContext cotntext) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home()
    );
  }
}
class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {
  List<String> names = [

  ];
  TextEditingController nameController = TextEditingController();
  @override
  Widget build (BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title:Text(
            "Teachers helper",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w900
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            names.removeAt(index);
                          });
                        },
                        child: ListTile(
                          title: Text(names[index]),
                        ),
                      );
                    }
                )
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Add new name",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                                    isDense: true

                                ),
                              ),
                            ),
                            RaisedButton(
                                child: Text("Add"),
                                onPressed: () {
                                  addToList();
                                }
                            ),
                          ],
                        ),
                        Builder(
                            builder: (context) => RaisedButton(
                                child: Text("Get Random Name"),
                                onPressed: () {
                                  var random = Random();
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content :Text("Random name is:" +names [random.nextInt(names.length)]))
                                  );
                                }
                            )
                        )
                      ],
                    )
                )
            )
          ],
        )
    );
  }
  void addToList() {
    if (nameController.text.isNotEmpty) {
      setState(() {
        names.add(nameController.text);
      });
    }
  }
}