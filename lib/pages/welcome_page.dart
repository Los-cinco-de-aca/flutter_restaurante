import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_do'),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.facebook),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play), onPressed: () {}),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.new_releases, color: Colors.red, size: 40),
            Text('Bienvenidos al restaurante',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
            Text('Disfruten de la comida',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
            Container(
              width: 220,
              height: 2,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
