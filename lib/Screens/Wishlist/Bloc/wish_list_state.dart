part of 'wish_list_bloc.dart';

@immutable
sealed class WishListState {}

class WishListInitial extends WishListState {}
class WishListActionState extends WishListState{}


class  WishListLoadedState extends WishListState{
  final List<ProductDataModal> wishListItems;
  WishListLoadedState({required this.wishListItems});

}
