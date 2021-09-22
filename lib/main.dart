import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskretofitpicsy/network/model/datas.dart';
import 'package:taskretofitpicsy/screens/photobooks.dart';
import 'package:taskretofitpicsy/screens/picsyhomepage.dart';
import 'network/apiservice/api_service.dart';
import 'network/model/bookresponses.dart';
import 'package:taskretofitpicsy/cubi.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Picsyhomepage(),

    );
  }
}
