import 'package:company_mangement_system/Screens/AddProduct.dart';
import 'package:company_mangement_system/Screens/ManageCategory.dart';
import 'package:company_mangement_system/Screens/ManageCompany.dart';
import 'package:company_mangement_system/Screens/Products.dart';
import 'package:company_mangement_system/Themes/ThemeData.dart';
import 'package:flutter/material.dart';

import 'Screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomePage(),
      theme: Themes.light,
        routes: <String, WidgetBuilder>{
      "/Products":(context)=>Products(),
          "/ManageCategory":(context)=>ManageCategory(),
          "/ManageCompany":(context)=>ManageCompany(companyModel: null,),
          "/AddProducts":(context)=>AddProducts(),

    },
    );
  }
}

