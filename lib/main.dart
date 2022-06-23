import 'package:flutter/material.dart';
import 'package:jadroo/provider/category_provider.dart';
import 'package:jadroo/provider/home_provider.dart';
import 'package:jadroo/screens/first_screen.dart';
import 'package:provider/provider.dart';

Future <void> main() async{
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider<HomeProvider>(create: (_)=>HomeProvider()),
     ChangeNotifierProvider<CategoryProvider>(create: (_)=>CategoryProvider()),
    ],
    child: MyApp(),),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Jadroo",
      home: HomeScreen
        (),
    );
  }
}

