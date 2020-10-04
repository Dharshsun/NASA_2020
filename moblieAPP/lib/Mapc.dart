import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobileAPP/uploadI.dart';

class Mapc extends StatelessWidget {
  Widget build(BuildContext context) {
    return new FlutterMap(
        options: new MapOptions(
            center: new LatLng(37.268600, -112.942500), minZoom: 14.0),
        layers: [
          new TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/abdullaalameri/ckfr5q38k17td19mwrntn0bmz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWJkdWxsYWFsYW1lcmkiLCJhIjoiY2tmcjZiNjJyMDBmZzJ4bW5venFkY2VyZCJ9.fsBZL3HgmgKNCiJMWUxnCA",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiYWJkdWxsYWFsYW1lcmkiLCJhIjoiY2tmcjZiNjJyMDBmZzJ4bW5venFkY2VyZCJ9.fsBZL3HgmgKNCiJMWUxnCA',
                'id': 'mapbox.satellite'
              }),
          MarkerLayerOptions(markers: [
            new Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(37.268600, -112.942500),
                builder: (ctx) => new Container(
                    child: IconButton(
                        icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                        color: Color(0xFFD32F2F),
                        iconSize: 45.0,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) {
                                return Upload();
                              });
                        })))
          ])
        ]);
  }
}
