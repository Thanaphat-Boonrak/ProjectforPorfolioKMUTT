import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("GAY BEAM")),
        body: GradientContainer(
            Color.fromARGB(255, 150, 243, 21), Color.fromARGB(255, 237, 9, 9)),
      ),
    ),
  );
}
