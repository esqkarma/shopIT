import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopIT/Screens/Home/Bloc/home_bloc.dart';
import 'package:shopIT/Utils/Components/Size.dart';
import 'package:shopIT/Utils/Custom_Widgets/Container.dart';
import 'package:shopIT/Utils/Custom_Widgets/Text.dart';

class HomeProduct extends StatelessWidget {
  final HomeBloc homeBloc;

  const HomeProduct({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    final loadedData = homeBloc.state as HomeLoadedState; // Direct cast
    return GridView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      crossAxisCount: 2,
      mainAxisExtent: Sizes.screenHeight * 0.33,
    ),
    itemBuilder: (BuildContext context, int index) {
      final product = loadedData.productDataModal[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Cont(
              height: Sizes.screenHeight * 0.30,
              width: Sizes.screenWidth,
              color: Colors.white70,
              blurRadius: 1.5,
              spreadRadius: 1,
              borderRadius: 20,
              borderWidth: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Texts(
                                color: Colors.black,
                                style: FontStyle.normal,
                                data: "Nike",
                                size: 17,
                                fontweight: FontWeight.w600),
                            Row(
                              children: [
                                IconButton(onPressed: () {
                                  homeBloc.add(HomeWhishListButtonClicked(clickedProduct: product));
                                }, icon: Icon(Icons.favorite_border)),
                                IconButton(onPressed: () {
                                  homeBloc.add(HomeCartButtonClicked(clickedProduct: product));
                                }, icon: Icon(Icons.shopping_bag_outlined)),
                              ],
                            ),
                          ],
                        ),
                        Texts(
                            color: Colors.black,
                            style: FontStyle.normal,
                            data: product.name,
                            size: 13,
                            fontweight: FontWeight.w100)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(product.imageUrl, filterQuality: FilterQuality.high, fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Texts(
                              color: Colors.black38,
                              style: FontStyle.normal,
                              data: "\$" + product.price.toString(),
                              size: 16,
                              fontweight: FontWeight.w600),
                          ElevatedButton(onPressed: () {
                            homeBloc.add(HomeBuyButtonClickedEvent(clickedProduct: product));
                          }, child: Text("Buy"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
    itemCount: loadedData.productDataModal.length,
          );
  }
}
