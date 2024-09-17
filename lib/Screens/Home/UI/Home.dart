import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Screens/Home/UI/HomeBanner.dart';
import 'package:shopIT/Screens/Home/UI/HomeBrandCategory.dart';
import 'package:shopIT/Screens/Home/UI/HomeCategory.dart';
import '../Bloc/home_bloc.dart';
import 'Home_Body.dart';
import 'Home_Top.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                  BoxDecoration(color: Colors.purple[100]),
                  child: Column(
                    children: [
                      const Home_top(),
                      Home_Category(),
                      Homebanner(),
                      BrandCategory(),
                    ],
                  ),
                ),
                HomeProduct(homeBloc: homeBloc),
              ],
            ),
          ),
        ));
  }
}
