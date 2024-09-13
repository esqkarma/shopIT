import 'package:flutter/material.dart';
import 'package:shopIT/Utils/Components/Size.dart';
import 'package:shopIT/Utils/Custom_Widgets/Container.dart';

import '../../../Utils/Custom_Widgets/Text.dart';

class Home_Category extends StatelessWidget {
  Home_Category({super.key});


 final  List<String> categoryDetails=[
   "men","women","sports","casual","jacket"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10),
      child: Column(
        children: [
          // Align(
          //   widthFactor: 20,
          //   heightFactor: 1.2,
          //   alignment: Alignment.topLeft,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: Texts(data:"popular categories",size: 20,fontweight: FontWeight.bold,),
          //     )),
          Container(
            height: Sizes.screenHeight*0.11,
            child: ListView.builder(
              itemCount: categoryDetails.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Homecategory_Tile(categoryName: categoryDetails[index]);
              },

            ),
          ),
        ],
      ),
    );
  }
}

class Homecategory_Tile extends StatelessWidget {
  final String categoryName;
  const Homecategory_Tile({required this.categoryName,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: CircleAvatar(
              radius: 35,

            ),
          ),
          Text(categoryName)
        ],
      ),
    );
  }
}

