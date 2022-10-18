// https://www.getpostman.com/collections/6da0a73ef5587fbe2a42
import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';

void main ( ) {
runApp(MyApp()) ;
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       routes: {
         Homepage.routeName: (ctx)=> Homepage(),
         UpdateProductPage.id: (ctx)=>UpdateProductPage()
       },
      initialRoute: Homepage.routeName,
    );
  }
}
