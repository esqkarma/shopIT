import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Screens/Cart/Bloc/cart_bloc.dart';
import 'package:shopIT/Screens/Cart/UI/CartProductTile.dart';
import 'package:shopIT/Screens/Wishlist/Bloc/wish_list_bloc.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, state) {
        if (state is CartLoadedState) {}
      },
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartLoadedState:
            final loadedData = state as CartLoadedState;
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Cart"),
                ),
                body: loadedData.cartItems.isEmpty?
                    Center(child: Text("Your cart is empty"),):
                ListView.builder(
                    itemCount: loadedData.cartItems.length,
                    itemBuilder: (context, index) {
                      return Cart_Product_Tile(
                          productDataModal: loadedData.cartItems[index],
                          cartBloc: cartBloc);
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
