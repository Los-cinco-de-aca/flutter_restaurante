import '../model/pruductos_model.dart';
import 'package:flutter/material.dart';

class ListaPag extends StatefulWidget {
  @override
  _ListaPagState createState() => _ListaPagState();
}

class _ListaPagState extends State<ListaPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Otra pagina',
        style: TextStyle(fontSize: 15.0),
      ),
    ));
  }
}
