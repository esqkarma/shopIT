import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopIT/Data/Wishlist_Data.dart';

import '../../../ProductModal/HomeProductModal.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishListState> emit) {
    emit(WishListLoadedState(wishListItems: wishListItem));
  }
}
