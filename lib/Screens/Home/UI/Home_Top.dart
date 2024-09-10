import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Utils/Custom_Widgets/Container.dart';
import '../Bloc/home_bloc.dart';

class Home_top extends StatelessWidget {
  //HomeBloc homeBloc;

  const Home_top({ super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(
            height: height*0.05,
            width: width*0.55,
              child: const SearchBar(
                hintText: "search",
              )),
         Row(
           children: [
             ElevatedButton(style: ElevatedButton.styleFrom(
                 minimumSize: Size(35,35 ),
                 maximumSize: Size(40, 40),
                 padding: EdgeInsets.zero,
                 shape: CircleBorder()
             ),
                 onPressed: (){
                   BlocProvider.of<HomeBloc>(context).add(HomeToCartNavigateEvent());
                 }, child: Icon(Icons.shopping_bag)),

             ElevatedButton(style: ElevatedButton.styleFrom(
                 padding: EdgeInsets.zero,
                 minimumSize: Size(35,35 ),
                 maximumSize: Size(40, 40),

                 shape: CircleBorder()),
                 onPressed: (){}, child: Icon(Icons.menu)),
           ],
         )




          // IconButton(
          //   onPressed: () {
          //     //  homeBloc.add(HomeToWhishListNavigateEvent());
          //     BlocProvider.of<HomeBloc>(context).add(HomeToWhishListNavigateEvent());
          //   },
          //   icon: Icon(Icons.favorite_border),
          // ),
          // IconButton(
          //   onPressed: () {
          //     BlocProvider.of<HomeBloc>(context).add(HomeToCartNavigateEvent());
          //   },
          //   icon: Icon(Icons.shopping_bag_outlined),
          // ),
        ],
      ),
    );
  }
}
