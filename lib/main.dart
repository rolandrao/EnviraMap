import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:unicorndial/unicorndial.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage()


    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();

}
//184b5c2a47a4d90ecc7f6c1d0b10a299ae49cd6e

class _MyHomePageState extends State<MyHomePage> {

  bool ozoneOn = true;
  bool airOn = false;
  bool so2On = false;
  Color c = const Color.fromRGBO(255,255,255,1.0);

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Ozone",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: c,
          mini: true,
          child: IconButton(icon: Image.asset('assets/ozone.png'),
              iconSize: 50.0),
          onPressed: () {
             setState(() {
               OzoneState();
             });
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Air Pollution",
        currentButton: FloatingActionButton(

            heroTag: "Air ",
            backgroundColor: c,
            mini: true,
            child: IconButton(icon: Image.asset('assets/carbondioxide.png')),
            onPressed: (){
              setState(() {
                AirState();
              });
            },
          )));

    childButtons.add(UnicornButton(

        hasLabel: true,
        labelText: "SO2",
        currentButton: FloatingActionButton(
            heroTag: "SO2",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.directions_car),
        onPressed: () {
          setState(() {
            so2State();
          });
        },)));
    return new Scaffold(

        //appBar: new AppBar(title: new Text('Leaflet Maps')),

        body: new SizedBox(
            width: 1000,
            height: 2000,

          child: Stack(
            children: <Widget>[
              Visibility(
                child: so2Map(),
                visible: so2On,
              ),
              Visibility(
                child: ozoneMap(),
                visible: ozoneOn,
              ),
              Visibility(
                child: airMap(),
                visible: airOn,
              ),
              new Container (
                alignment: Alignment.bottomRight,
                child: new UnicornDialer(
                    hasBackground: false,
                    parentButtonBackground: Colors.redAccent,
                    orientation: UnicornOrientation.VERTICAL,
                    parentButton: Icon(Icons.add),
                    childButtons: childButtons),
              )


            ],
          )

        )







    );
  }

  OzoneState() {
    setState(() {
      this.ozoneOn = true;
      this.airOn = false;
      this.so2On = false;
    });
  }
  AirState() {
    this.airOn = true;
    this.ozoneOn = false;
    this.so2On = false;
  }
  so2State() {
    this.so2On = true;
    this.ozoneOn = false;
    this.airOn = false;
  }
}





Container ozoneMap() {
  return new Container (
      child: new FlutterMap(

          options: new MapOptions(
              center: new LatLng(35.22, -101.83), minZoom: 1.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                "https://api.mapbox.com/styles/v1/aneesh19/cjtc2jcpw00f31em0wcd4cb0z/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5lZXNoMTkiLCJhIjoiY2p0YXc1czdtMDBtYTQzcGQ5NnVrNHBraSJ9.Zhq1KNQPImacBi-bHyORuA",
                additionalOptions: {
                  'accessToken':
                  'pk.eyJ1IjoiYW5lZXNoMTkiLCJhIjoiY2p0YXc1czdtMDBtYTQzcGQ5NnVrNHBraSJ9.Zhq1KNQPImacBi-bHyORuA',
                  'id': 'mapbox.mapbox-terrain-v2'
                }),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(35.215, -101.825),
                  builder: (context) => new Container(
                    width: 48.0,
                    height: 48.0,

                  ))
            ]),

          ]

      )
  );
}

Container airMap() {
  return new Container (
      child: new FlutterMap(

          options: new MapOptions(
              center: new LatLng(35.22, -101.83), minZoom: 1.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                "https://api.mapbox.com/styles/v1/aneesh19/cjtbwojix1g701fn00cwga0lx/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5lZXNoMTkiLCJhIjoiY2p0YXc1czdtMDBtYTQzcGQ5NnVrNHBraSJ9.Zhq1KNQPImacBi-bHyORuA",
                additionalOptions: {
                  'accessToken':
                  'pk.eyJ1IjoiYW5lZXNoMTkiLCJhIjoiY2p0YXc1czdtMDBtYTQzcGQ5NnVrNHBraSJ9.Zhq1KNQPImacBi-bHyORuA',
                  'id': 'mapbox.mapbox-terrain-v2'
                }),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(35.215, -101.825),
                  builder: (context) => new Container(
                    width: 48.0,
                    height: 48.0,

                  ))
            ]),

          ]

      )
  );
}

Container so2Map() {
  return new Container (
      child: new FlutterMap(

          options: new MapOptions(
              center: new LatLng(35.22, -101.83), minZoom: 1.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                "https://tiles.waqi.info/tiles/usepa-co/{z}/{x}/{y}.png?token=184b5c2a47a4d90ecc7f6c1d0b10a299ae49cd6e",
                /*additionalOptions: {
                  'accessToken':
                  'pk.eyJ1IjoiYW5lZXNoMTkiLCJhIjoiY2p0YXc1czdtMDBtYTQzcGQ5NnVrNHBraSJ9.Zhq1KNQPImacBi-bHyORuA',
                  'id': 'mapbox.mapbox-terrain-v2'
                }*/),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(35.215, -101.825),
                  builder: (context) => new Container(
                    width: 48.0,
                    height: 48.0,

                  ))
            ]),

          ]

      )
  );
}



