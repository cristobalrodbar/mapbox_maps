import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController? mapController;
  final center = LatLng(37.810575, -122.477174);
  final darkStyle = 'mapbox://styles/0miedo/clft67ya200ek01mxx7o7qd94';
  final streetsStyle = 'mapbox://styles/0miedo/clft69nnw00j001qj8v9m8bk5';
  String selectedStyle = 'mapbox://styles/0miedo/clft69nnw00j001qj8v9m8bk5';

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }
  //fACCESS_TOKEN=sk.eyJ1IjoiMG1pZWRvIiwiYSI6ImNsZnQ1bXU5bjBjb3kzb3F3cGw0dXFyOWoifQ.iyY7I3YOacx-6Fcs0uLVJg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.emoji_symbols),
              onPressed: () {
                mapController?.addSymbol(SymbolOptions(
                    geometry: center,
                    textField: 'montaña creada',
                    iconImage: 'attraction-15',
                    textOffset: Offset(0, 2),
                    iconSize: 3));
              }),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
              child: Icon(Icons.zoom_in),
              onPressed: () {
                mapController?.animateCamera(CameraUpdate.zoomIn());
              }),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
              child: Icon(Icons.zoom_out),
              onPressed: () {
                mapController?.animateCamera(CameraUpdate.zoomOut());
              }),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              if (selectedStyle == darkStyle)
                selectedStyle = streetsStyle;
              else
                selectedStyle = darkStyle;

              setState(() {});
            },
            child: Icon(Icons.add_to_home_screen),
          ),
        ],
      ),
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
      /*      accessToken: const String.fromEnvironment(
        "sk.eyJ1IjoiMG1pZWRvIiwiYSI6ImNsZnQ1bXU5bjBjb3kzb3F3cGw0dXFyOWoifQ.iyY7I3YOacx-6Fcs0uLVJg"),
    */
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
    );
  }
}
