import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Index/IndexPage.dart';
import 'package:shopIT/Screens/Home/UI/Home.dart';

import 'Screens/Home/Bloc/home_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF014D40),  // Dark Emerald Green// Rich Gold
        scaffoldBackgroundColor: Color(0xFFFFFFFF),  // White or Ivory background


      ),
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: Indexpage(),
      ),
    );
  }
}
