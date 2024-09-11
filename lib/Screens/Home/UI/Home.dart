import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Screens/Cart/UI/CartScreen.dart';
import 'package:shopIT/Screens/Home/UI/HomeBanner.dart';
import 'package:shopIT/Screens/Home/UI/HomeBrandCategory.dart';
import 'package:shopIT/Screens/Home/UI/HomeCategory.dart';
import 'package:shopIT/Screens/Wishlist/UI/Wish_List_Screen.dart';
import 'package:shopIT/User/User.dart';
import 'package:shopIT/Utils/Custom_Widgets/SnackBar.dart';

import '../Bloc/home_bloc.dart';
import 'Home_Body.dart';
import 'Home_Top.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close(); // Close the bloc when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeToWhishlistNavigatePageActionState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const Wish_List_Screen()));
          } else if (state is HomeToCartNavigatePageActionState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Cartscreen()));
          } else if (state is HomeToUserDetailsNavigateActionState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const UserDetails()));
          } else if (state is HomeProductAddedToCartActionState) {
            SnackBarHelper.showAddToCartSnackBar(context);
          }
        },
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            case HomeLoadedState:
              // double height = MediaQuery.of(context).size.height;
              // double width = MediaQuery.of(context).size.width;
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
      ),
    );
  }
}
