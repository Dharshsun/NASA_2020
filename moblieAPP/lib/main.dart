import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Mapc.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Fuego! '),
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {})
          ],
        ),
        body: Mapc());
    /*
            RaisedButton(
                                            onPressed: () =>
                                                print('incident Reported'),
                                            color: Color(0xFFD32F2F),
                                            child:
                                                Text("Report an incident?"))
            */
  }
}
