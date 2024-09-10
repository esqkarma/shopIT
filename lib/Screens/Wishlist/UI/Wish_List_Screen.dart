import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Screens/Cart/Bloc/cart_bloc.dart';
import 'package:shopIT/Screens/Cart/UI/CartProductTile.dart';
import 'package:shopIT/Screens/Wishlist/Bloc/wish_list_bloc.dart';
import 'package:shopIT/Screens/Wishlist/UI/Wishlist_Product_Tile.dart';

class Wish_List_Screen extends StatefulWidget {
  const Wish_List_Screen({super.key});

  @override
  State<Wish_List_Screen> createState() => _Wish_List_ScreenState();
}

class _Wish_List_ScreenState extends State<Wish_List_Screen> {
  final WishListBloc wishListBloc = WishListBloc();

  @override
  void initState() {
    wishListBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListBloc, WishListState>(
      bloc:wishListBloc,
      listener: (context, state) {
        if (state is WishListLoadedState) {}},
      listenWhen: (previous, current) => current is WishListActionState,
      buildWhen: (previous, current) => current is !WishListActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishListLoadedState:
            final loadedData = state as  WishListLoadedState;
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text("WishList"),
                ),
                body: ListView.builder(
                    itemCount: loadedData.wishListItems.length,
                    itemBuilder: (context, index) {
                      return WishList_Product_Tile(
                          productDataModal: loadedData.wishListItems[index],
                          wishListBloc: wishListBloc);
                    }),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
