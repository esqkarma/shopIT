part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState{}


class CartInitialState extends CartState {}

class CartLoadedState extends CartState{
  final List<ProductDataModal> cartItems;
  CartLoadedState({required this.cartItems});

}