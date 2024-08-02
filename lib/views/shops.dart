import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopView extends StatefulWidget {
  ShopView({Key? key}) : super(key: key);

  @override
  _ShopViewState createState() => _ShopViewState();
}

//additional files:---------------------------------
//import 'package:latlong/latlong.dart';
//import 'package:url_launcher/url_launcher.dart';
//--------------------------------------------------
//https://www.openstreetmap.org/#map=14/7.1189/80.0124
//https://api.flutter.dev/flutter/material/IconButton-class.html
//https://pub.dev/packages/url_launcher

class _ShopViewState extends State<ShopView> {
  //URI Launcher eken ape 4n eke thiyena app walata data pass karanna puluwan.
  //Ex: google map open karanna location ekath ekka. / number ekak pass karala phone eke call pad eka open karanna

  static Future<void> openGoogleMap(double latitude, double longitude) async {
    String googleURL = Uri.decodeFull(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunch(googleURL)) {
      await launch(googleURL);
    } else {
      throw 'Could not open the google map';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(7.1309, 79.964),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(7.1688, 79.9479),
              builder: (ctx) => Container(
                child: const Icon(
                  Icons.place,
                  color: Colors.red,
                  size: 48.0,
                  semanticLabel: 'Minwangoda Shop',
                ),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(7.0924, 79.9924),
              builder: (ctx) => Container(
                // child: const Icon(
                //   Icons.place,
                //   color: Colors.red,
                //   size: 48.0,
                //   semanticLabel: 'Gampaha Shop',
                // ),
                child: IconButton(
                  icon: const Icon(
                    Icons.place,
                    color: Colors.red,
                    size: 48.0,
                    semanticLabel: 'Gampaha Shop',
                  ),
                  tooltip: 'Show gampaha location',
                  onPressed: () {
                    openGoogleMap(7.0924, 79.9924);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
