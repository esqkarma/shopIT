import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopIT/Data/Cart_Item_Data.dart';
import 'package:shopIT/Data/Data.dart';
import 'package:shopIT/Data/Wishlist_Data.dart';

import '../../../ProductModal/HomeProductModal.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //Initial Event
    on<HomeInitialEvent>(homeInitialEvent);

    //Navigation Home => WishList
    on<HomeToWhishListNavigateEvent>(homeToWhishListNavigateEvent);

    //Navigation Home => Cart
    on<HomeToCartNavigateEvent>(homeToCartNavigateEvent);

    //Home => UserDetails
    on<HomeToUserDetailsNavigateEvent>(homeToUserDetailsNavigateEvent);

    //Bottom Nav Home
    on<BottomNavigationHomeButtonClicked>(bottomNavigationHomeButtonClicked);

    //Bottom Nav Cart
    on<BottomNavigationShopButtonClicked>(bottomNavigationShopButtonClicked);

    //Cart Button Event
    on<HomeCartButtonClicked>(homeCartButtonClicked);

    // WishList Button Event
    on<HomeWhishListButtonClicked>(homeWhishListButtonClicked);

    //Buy button Event
    on<HomeBuyButtonClickedEvent>(homeBuyButtonClickedEvent);

    //
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedState(
        productDataModal: ProductData.productData
            .map((e) => ProductDataModal(
                  id: e['id'],
                  name: e['name'],
                  price: e['price'],
                  imageUrl: e['imageUrl'],
                ))
            .toList()));
  }

  FutureOr<void> homeToWhishListNavigateEvent(
      HomeToWhishListNavigateEvent event, Emitter<HomeState> emit) {
    //Home action state
    emit(HomeToWhishlistNavigatePageActionState());
  }

  FutureOr<void> homeToCartNavigateEvent(
      HomeToCartNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeToCartNavigatePageActionState());
  }

  FutureOr<void> homeCartButtonClicked(
      HomeCartButtonClicked event, Emitter<HomeState> emit) {
    cartItem.add(event.clickedProduct);
    emit(HomeProductAddedToCartActionState());
  }

  FutureOr<void> homeWhishListButtonClicked(
      HomeWhishListButtonClicked event, Emitter<HomeState> emit) {
    wishListItem.add(event.clickedProduct);
    emit(HomeProductWishlistedActionState());
  }

  FutureOr<void> homeToUserDetailsNavigateEvent(
      HomeToUserDetailsNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeToUserDetailsNavigateActionState());
  }

  FutureOr<void> bottomNavigationHomeButtonClicked(
      BottomNavigationHomeButtonClicked event, Emitter<HomeState> emit) {
    emit(BottomNavigationHomeButtonClickedState(index: 0));
  }

  FutureOr<void> bottomNavigationShopButtonClicked(
      BottomNavigationShopButtonClicked event, Emitter<HomeState> emit) {
    emit(BottomNavigationShopButtonClickedState(index: 1));
  }

  FutureOr<void> homeBuyButtonClickedEvent(
      HomeBuyButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeBuyButtonClickedState());

  }
}
