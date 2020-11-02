import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_http_post_request/model/pruductos_response_data.dart';
import 'package:flutter_http_post_request/pages/login_page.dart';
import 'package:flutter_http_post_request/api/api_service.dart';
import '../model/pruductos_model.dart';
import '../pages/carrito_page.dart';
import '../pages/welcome_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductosModel> _productosModel = List<ProductosModel>();

  List<ProductosModel> _listaCarro = List<ProductosModel>();
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    _productosDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurante los de aca'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 38,
                    ),
                    if (_listaCarro.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            _listaCarro.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0),
                          ),
                        ),
                      )
                  ],
                ),
                onTap: () {
                  // if (_listaCarro.isNotEmpty)
                  print("linea61");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_listaCarro),
                    ),
                  );
                }),
          )
        ],
      ),
      drawer: Container(
          width: 170.0,
          child: Drawer(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.red[900],
                child: new ListView(
                  padding: EdgeInsets.only(top: 50.0),
                  children: <Widget>[
                    Container(
                      height: 120,
                      child: new UserAccountsDrawerHeader(
                        accountName: new Text(''),
                        accountEmail: new Text(''),
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                                image: AssetImage('assets/images/food1.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: new Icon(
                        Icons.home,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Pagina1Page())),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        'Producto en lista',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: new Icon(
                        Icons.fastfood,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Cart(_listaCarro))),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        'Tiendas',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: new Icon(
                        Icons.place,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage())),
                    ),
                    new Divider(),
                  ],
                )),
          )),
      body: _cuadroProductos(),
    );
  }

  GridView _cuadroProductos() {
    return GridView.builder(
      padding: const EdgeInsets.all(4.0),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _productosModel.length,
      itemBuilder: (context, index) {
        final String image = _productosModel[index].image;
        var item = _productosModel[index];
        var gestureDetector = GestureDetector(
          child: (!_listaCarro.contains(item))
              ? Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                  size: 38,
                )
              : Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                  size: 38,
                ),
          onTap: () {
            setState(() {
              if (!_listaCarro.contains(item))
                _listaCarro.add(item);
              else
                _listaCarro.remove(item);
            });
          },
        );
        return Card(
            elevation: 4.0,
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: new Image.asset("assets/images/$image",
                          fit: BoxFit.contain),
                    ),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          item.price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                            bottom: 8.0,
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              child: (!_listaCarro.contains(item))
                                  ? Icon(
                                      Icons.shopping_cart,
                                      color: Colors.red,
                                      size: 38,
                                    )
                                  : Icon(
                                      Icons.shopping_cart,
                                      color: Colors.red,
                                      size: 38,
                                    ),
                              onTap: () {
                                setState(() {
                                  if (!_listaCarro.contains(item))
                                    _listaCarro.add(item);
                                  else
                                    _listaCarro.remove(item);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ));
      },
    );
  }

  void _productosDb() {
    var apiService = APIService();

    //var list2 = List<ProductosModel>();

    apiService.getProducts().then((value) {
      if (value != null) {
        setState(() {
          isApiCallProcess = false;
        });
      }

      ProductosModel productModel;

      //List<ProductosResponseData> data = value.data;
      print(value.data.length);
      /*for (int a = 0; a < data.length; a++) {
        print("asdasdasd ");
        productModel = ProductosModel();
        productModel.color = data[a].color;
        productModel.image = "food1.png";
        productModel.name = data[a].name;
        productModel.price = a * 4;
        productModel.quantity = a * 2;

        list2.add(productModel);
      }*/
    });

    var list1 = <ProductosModel>[
      ProductosModel(
        name: 'McDonalds',
        image: 'food1.png',
        price: 12,
      ),
      ProductosModel(
        name: 'Pizza3',
        image: 'food2.png',
        price: 12,
      ),
      ProductosModel(
        name: 'Carnes',
        image: 'food3.png',
        price: 15,
      ),
      ProductosModel(
        name: 'Burgur King',
        image: 'food4.png',
        price: 40,
      ),
      ProductosModel(
        name: 'Asado',
        image: 'food5.png',
        price: 30,
      ),
      ProductosModel(
        name: 'Pizza',
        image: 'food6.png',
        price: 29,
      ),
      ProductosModel(
        name: 'Empanada',
        image: 'food7.png',
        price: 13,
      ),
      ProductosModel(
        name: 'Postre',
        image: 'food8.png',
        price: 12,
      ),
    ];

    setState(() {
      _productosModel = list1;
    });
  }
}
