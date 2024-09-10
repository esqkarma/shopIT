part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartItemAddedEvent extends CartEvent{}

class CartItemRemoveEvent extends CartEvent{
  final ProductDataModal productDataModal;

  CartItemRemoveEvent({required this.productDataModal});

}
