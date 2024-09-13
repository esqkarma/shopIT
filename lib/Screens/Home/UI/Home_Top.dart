import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Utils/Components/Size.dart';
import 'package:shopIT/Utils/Custom_Widgets/Container.dart';
import '../Bloc/home_bloc.dart';

class Home_top extends StatelessWidget {
  //HomeBloc homeBloc;

  const Home_top({ super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(
            height: Sizes.screenHeight*0.05,
            width: Sizes.screenWidth*0.55,
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
        ],
      ),
    );
  }
}
