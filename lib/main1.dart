import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loadingpage(),
    );
  }
}

class loadingpage extends StatelessWidget {
  const loadingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Container container1 = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.green,
            Colors.white,
          ] ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/logo1.png', width: 100, height: 100,)
        ],
      ),
    );
    return loadingpage();
  }
}

void main() {
  runApp(MaterialApp(
    home: loadingpage(), // Memanggil LoadingPage
  ));
}
