import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Screens/Cart/UI/CartScreen.dart';
import 'package:shopIT/Screens/Home/UI/HomeBanner.dart';
import 'package:shopIT/Screens/Home/UI/HomeBrandCategory.dart';
import 'package:shopIT/Screens/Home/UI/HomeCategory.dart';
import 'package:shopIT/Screens/Product/ProductDetails.dart';
import 'package:shopIT/Screens/Wishlist/UI/Wish_List_Screen.dart';
import 'package:shopIT/User/User.dart';
import 'package:shopIT/Utils/Custom_Widgets/SnackBar.dart';

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
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {



      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,

      builder: (context, state) {
        switch (state.runtimeType) {

          case HomeLoadedState:
            return
                 SafeArea(
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

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
