import 'package:flutter/material.dart';
import 'package:mapbox_maps/src/views/fullscreenmap.dart';

//sk.eyJ1IjoiMG1pZWRvIiwiYSI6ImNsZnQ1bXU5bjBjb3kzb3F3cGw0dXFyOWoifQ.iyY7I3YOacx-6Fcs0uLVJg
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Scaffold(
        body: FullScreenMap(),
      )),
    );
  }
}
