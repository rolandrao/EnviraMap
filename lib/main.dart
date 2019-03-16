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

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Ozone",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: Colors.white,
          mini: true,
          child: IconButton(icon: Image.asset('assets/ozone.png'),
              iconSize: 50.0),
          onPressed: () {

          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Air Pollution",
        currentButton: FloatingActionButton(

            heroTag: "Air ",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.airplanemode_active))));

    childButtons.add(UnicornButton(

        hasLabel: true,
        labelText: "SO2",
        currentButton: FloatingActionButton(
            heroTag: "SO2",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.directions_car))));
    return new Scaffold(

        //appBar: new AppBar(title: new Text('Leaflet Maps')),

        body: new SizedBox(
            width: 1000,
            height: 2000,

          child: Stack(

            children: <Widget>[
              Visibility(
                child: ozoneMap(),
                visible: true,
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
}

class unicornWidget extends StatefulWidget{
  @override
  unicornState createState() => new unicornState();
}

class unicornState extends State<unicornWidget> {

  Widget build(BuildContext context) {

    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Ozone",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.train),
          onPressed: () {},
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Air Pollution",
        currentButton: FloatingActionButton(

            heroTag: "Air ",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.airplanemode_active))));

    childButtons.add(UnicornButton(

        hasLabel: true,
        labelText: "SO2",
        currentButton: FloatingActionButton(
            heroTag: "SO2",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.directions_car))));
    return Scaffold(
        floatingActionButton: UnicornDialer(
            hasBackground: false,
            parentButtonBackground: Colors.redAccent,
            orientation: UnicornOrientation.VERTICAL,
            parentButton: Icon(Icons.add),
            childButtons: childButtons),


    );
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

Container airMap() {
  return new Container (
      child: new FlutterMap(

          options: new MapOptions(
              center: new LatLng(35.22, -101.83), minZoom: 1.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                "https://api.mapbox.com/styles/v1/aneesh19/cjtc2eaw700ag1em0475js9tq/tiles/256/%7Bz%7D/%7Bx%7D/%7By%7D@2x?access_token=pk.eyJ1IjoiYW5lZXNoMTkiLCJhIjoiY2p0YXc1czdtMDBtYTQzcGQ5NnVrNHBraSJ9.Zhq1KNQPImacBi-bHyORuA",
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


