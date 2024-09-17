part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState{}

 class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedState extends  HomeState{
 final List<ProductDataModal> productDataModal;

  HomeLoadedState({required this.productDataModal});

}

class HomeErrorState extends HomeState{}


//Home Action States
class HomeToCartNavigatePageActionState extends HomeActionState{}

class HomeToWhishlistNavigatePageActionState extends HomeActionState{}

class HomeProductWishlistedActionState extends HomeActionState{}

class HomeProductAddedToCartActionState extends HomeActionState{}

class HomeToUserDetailsNavigateActionState extends HomeActionState{}


class HomeBuyButtonClickedState extends HomeActionState{
 final ProductDataModal clickedProduct;

  HomeBuyButtonClickedState({required this.clickedProduct});

}






class BottomNavigationHomeButtonClickedState extends HomeActionState{
 final int index;
 BottomNavigationHomeButtonClickedState({required this.index});
}

class BottomNavigationShopButtonClickedState extends HomeActionState{
 final int index;

  BottomNavigationShopButtonClickedState({required this.index});

}