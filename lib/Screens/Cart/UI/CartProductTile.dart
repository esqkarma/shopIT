import 'package:flutter/material.dart';
import 'package:shopIT/Utils/Components/Size.dart';
import 'package:shopIT/Utils/Custom_Widgets/Container.dart';
import 'package:shopIT/Utils/Custom_Widgets/Text.dart';
import '../../../ProductModal/HomeProductModal.dart';
import '../Bloc/cart_bloc.dart';

class Cart_Product_Tile extends StatelessWidget {
  final ProductDataModal productDataModal;
  final CartBloc cartBloc;
  Cart_Product_Tile({super.key, required this.productDataModal, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:3,right: 3,top: 10,bottom: 5),
      child: Cont(

          height: Sizes.screenHeight * 0.55,
          width: Sizes.screenWidth,
          color: Colors.white,
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
                              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),


                              //Icon button for add to cart
                              IconButton(onPressed: (){
                                cartBloc.add(CartItemRemoveEvent(productDataModal: productDataModal));
                              }, icon: Icon(Icons.shopping_bag))
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
                    padding: const EdgeInsets.only(left: 30,right: 30),
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
    );
  }
}
