import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Screens/Home/Bloc/home_bloc.dart';
import 'package:shopIT/Utils/Components/Size.dart';

import '../../Utils/Custom_Widgets/Container.dart';
import '../../Utils/Custom_Widgets/Text.dart';

class Productdetails extends StatelessWidget {
  final HomeBloc homeBloc;

  const Productdetails({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    final loadedData = homeBloc.state as HomeBuyButtonClickedState;
    return BlocProvider.value(
      value: homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
        },

        listenWhen: (pre, curr) => curr is HomeActionState,
        buildWhen: (pre, curr) => curr is! HomeActionState,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Cont(
                      height: Sizes.screenHeight,
                      width: Sizes.screenWidth,
                      color: Colors.blue,
                      child: ListView(
                        children: [
                          Cont(
                            height: Sizes.screenHeight * 0.40,
                            width: Sizes.screenWidth,
                            // color: Colors.red,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.favorite_border)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.shopping_bag_outlined))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    loadedData.clickedProduct.imageUrl,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            children: [
                              Cont(child: Texts(data: "",)),
                            ],
                          )

                          // Cont(child: Texts(data: ""))
                        ],
                      )),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Cont(
                          height: Sizes.screenHeight * 0.08,
                          width: Sizes.screenWidth,
                          color: Colors.grey[100],
                          borderRadius: 25,
                          blurRadius: 5,
                          spreadRadius: 1,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Texts(
                                  data: "\$ " +
                                      loadedData.clickedProduct.price
                                          .toString(),
                                ),
                                ElevatedButton(
                                  onPressed: () {}, child: Texts(
                                  data: "GET",
                                  size: 20,
                                  fontweight: FontWeight.w400,
                                ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(Sizes.screenWidth * 0.25,
                                        Sizes.screenHeight * 0.08 * 0.70),
                                  ),)
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
