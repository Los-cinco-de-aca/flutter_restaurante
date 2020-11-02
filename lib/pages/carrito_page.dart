import 'dart:ui';

import 'package:flutter/material.dart';
import '../model/pruductos_model.dart';

class Cart extends StatefulWidget {
  final List<ProductosModel> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(_cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  final _scrollController = ScrollController();
  var _firstScroll = true;
  final _enabled = false;

  List<ProductosModel> _cart = List<ProductosModel>();

  /*@override
  void initState() {
    super.initState();
    _productosDb();
  }*/

  Container pagoTotal(List<ProductosModel> _cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          // Text("Total:  \$${valorTotal(_cart)}",
          //Text("Total:  ",
          //Text("Total:  \$${valorTotal(_cart)}",
          Text('Total:',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black))
        ],
      ),
    );
  }

  String valorTotal(List<ProductosModel> listaProductos) {
    double total = 0.0;

    for (int i = 0; i < listaProductos.length; i++) {
      total = total + listaProductos[i].price * listaProductos[i].quantity;
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.restaurant_menu),
            onPressed: null,
            color: Colors.white,
          )
        ],
        title: Text(
          'Detalle',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
        ),
        backgroundColor: Colors.red,
      ),
      body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (_enabled && _firstScroll) {
              _scrollController
                  .jumpTo(_scrollController.position.pixels - details.delta.dy);
            }
          },
          onVerticalDragEnd: (_) {
            if (_enabled) _firstScroll = false;
          },
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  final String imagen = _cart[index].image;
                  var item = _cart[index];
                  //item.quantity = 0;
                  return Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 150,
                                    height: 150,
                                    child: new Image.asset(
                                        "assets/images/$imagen",
                                        fit: BoxFit.contain),
                                  ),
                                  Column(children: <Widget>[
                                    Text(
                                      item.name,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 120,
                                          height: 40,
                                        )
                                      ],
                                    )
                                  ])
                                ],
                              ),
                            ],
                          ))
                    ],
                  );
                },
              )
            ],
          ))),
    );
  }
}
