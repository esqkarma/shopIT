import 'package:flutter/material.dart';
import 'package:shopIT/Screens/Home/Bloc/home_bloc.dart';
import 'package:shopIT/Utils/Custom_Widgets/Container.dart';
import 'package:shopIT/Utils/Custom_Widgets/Text.dart';

import '../../../ProductModal/HomeProductModal.dart';

class Product_Tile extends StatelessWidget {
  final ProductDataModal productDataModal;
  final HomeBloc homeBloc;
   Product_Tile({super.key, required this.productDataModal, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: [
          Cont(

              height: height * 0.55,
              width: width,
              color: Colors.purple[50],
              blurRadius: 1.5,
              spreadRadius:1,
              borderRadius: 20,
              borderWidth: 1,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30,top: 10),
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
                                  size: 25,
                                  fontweight: FontWeight.w600),
                              Row(
                                children: [

                                  //Icon button for Wishlist or favorite
                                  IconButton(onPressed: (){
                                    homeBloc.add(HomeWhishListButtonClicked(
                                        clickedProduct: productDataModal));
                                  }, icon: Icon(Icons.favorite_border)),


                                 //Icon button for add to cart
                                  IconButton(onPressed: (){
                                    homeBloc.add(HomeCartButtonClicked(
                                        clickedProduct: productDataModal));
                                  }, icon: Icon(Icons.shopping_bag_outlined))
                                ],
                              )
                            ],
                          ),
                          Texts(
                              color: Colors.black,
                              style: FontStyle.normal,
                              data: productDataModal.name,
                              size: 16,
                              fontweight: FontWeight.w100)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Image.asset(productDataModal.imageUrl,filterQuality: FilterQuality.high,)),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Texts(color: Colors.black38,
                                style: FontStyle.normal,
                                data: "\$"+productDataModal.price.toString(),
                                size: 16,
                                fontweight: FontWeight.w600),
                            ElevatedButton(onPressed: (){
                            }, child: Text("Buy"))
                          ],
                        ),
                      )
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
