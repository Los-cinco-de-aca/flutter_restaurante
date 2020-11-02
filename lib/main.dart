import 'package:flutter/material.dart';
import 'package:flutter_http_post_request/model/pruductos_model.dart';
import 'package:flutter_http_post_request/pages/carrito_page.dart';
import 'package:flutter_http_post_request/pages/registre_page.dart';
import 'pages/registre_page.dart';
import 'pages/login_page.dart';
import 'pages/welcome_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ProductosModel> _cart;
    return MaterialApp(
        title: 'Image Loader',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          accentColor: Colors.redAccent,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
            headline2: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: Colors.redAccent,
            ),
            bodyText1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent,
            ),
          ),
        ),
        home: LoginPage(),
        initialRoute: '/',
        routes: {
          '/registre_page': (context) => FormPage(),
          '/welcome_page': (context) => Pagina1Page(),
          '/menu_page': (context) => MyHomePage(),
          '/carrito_page': (context) => Cart(_cart),
        });
  }
}
