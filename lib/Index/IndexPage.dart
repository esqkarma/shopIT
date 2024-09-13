import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Screens/Cart/UI/CartScreen.dart';
import 'package:shopIT/Screens/Home/Bloc/home_bloc.dart';
import 'package:shopIT/Screens/Home/UI/Home.dart';

import '../Screens/Product/ProductDetails.dart';
import '../Screens/Wishlist/UI/Wish_List_Screen.dart';
import '../User/User.dart';
import '../Utils/Custom_Widgets/SnackBar.dart';

class Indexpage extends StatefulWidget {
  const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {

  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }


  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    Cartscreen(),
    // Add screens for Explore, Shop, and Account
    Center(child: Text('Explore Screen')),
    Center(child: Text('Shop Screen')),
    Center(child: Text('Account Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {

          //Navigate to WishList Page
          if (state is HomeToWhishlistNavigatePageActionState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const Wish_List_Screen()));
          }

          //Navigation to cart Page
          else if (state is HomeToCartNavigatePageActionState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Cartscreen()));
          }


          //Navigation to User Details Page
          else if (state is HomeToUserDetailsNavigateActionState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const UserDetails()));
          }

          //custom SnackBar
          else if (state is HomeProductAddedToCartActionState) {

            SnackBarHelper.showAddToCartSnackBar(context);
          }

          //Buy Button in Home Page
          else if(state is HomeBuyButtonClickedState){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Productdetails()));
          }




        },
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        builder: (context, state) {
          if(state is HomeLoadingState)
            {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          else if(state is HomeLoadedState)
          return Scaffold(
              body: screens[currentIndex],
              bottomNavigationBar:
              BottomNavigationBar(
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  currentIndex: currentIndex,
                  selectedItemColor: Colors.black54,
                  mouseCursor: MouseCursor.uncontrolled,
                  items: [
                    BottomNavigationBarItem(

                        backgroundColor: Colors.purple[100],
                        label: "home",
                        icon: Icon(Icons.home)),
                    BottomNavigationBarItem(icon: Icon(Icons.explore),
                        label: "Explore"),
                    BottomNavigationBarItem(
                        label: "Shop", icon: Icon(Icons.shopping_bag)),
                    BottomNavigationBarItem(icon: Icon(Icons.person),
                        label: "Account")
                  ])
          );
          return Scaffold(body: Center(
            child: Text("Oombi"),
          ),);
        },
      ),
    );
  }
}
