part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeWhishListButtonClicked extends HomeEvent{
  final ProductDataModal clickedProduct;

  HomeWhishListButtonClicked({required this.clickedProduct});

}

class HomeCartButtonClicked extends HomeEvent{
  final ProductDataModal clickedProduct;

  HomeCartButtonClicked({required this.clickedProduct});
}

class HomeToWhishListNavigateEvent extends HomeEvent{}

class HomeToCartNavigateEvent extends HomeEvent{}


class HomeToUserDetailsNavigateEvent extends HomeEvent{}


class HomeBuyButtonClickedEvent extends HomeEvent{}

class BottomNavigationHomeButtonClicked extends HomeEvent{}

class BottomNavigationShopButtonClicked extends HomeEvent{}