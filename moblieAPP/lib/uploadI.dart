import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File imageFile;
  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openGallary(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Upload or Take a Picture: '),
              content: SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.upload),
                        color: Color(0xFFD32F2F),
                        iconSize: 45.0,
                        onPressed: () {
                          _openGallary(context);
                        },
                      ),
                      onTap: () {
                        _openGallary(context);
                      }),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.camera),
                        color: Color(0xFFD32F2F),
                        iconSize: 45.0,
                        onPressed: () {
                          _openCamera(context);
                        },
                      ),
                      onTap: () {
                        _openCamera(context);
                      })
                ],
              )));
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Image.asset('assets/fine.png');
    } else {
      return Image.file(imageFile, width: 300, height: 300);
    }
  }

  Widget _decideButton() {
    if (imageFile == null) {
      return RaisedButton(
          onPressed: () {
            _showImage(context);
          },
          color: Color(0xFFD32F2F),
          child: Text("Report an incident?📷"));
    } else {
      return IconButton(
          icon: Icon(FontAwesomeIcons.paperPlane),
          color: Color(0xFFD32F2F),
          iconSize: 45.0,
          onPressed: () {});
    }
  }

  Widget _decideMessage() {
    if (imageFile == null) {
      return Text('*False Reporting May Lead to Legal Proceedings');
    } else {
      return Text("Forest Fire Grade 3",
          style: TextStyle(fontSize: 28, color: Color(0xFFD00a2F)),
          textAlign: TextAlign.center);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _decideImageView(),
            _decideMessage(),
            _decideButton(),
          ],
        ));
  }
}
