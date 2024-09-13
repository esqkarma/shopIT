import 'package:flutter/material.dart';
import 'package:shopIT/Utils/Components/Size.dart';
import 'package:shopIT/Utils/Custom_Widgets/Container.dart';
import 'package:shopIT/Utils/Custom_Widgets/Text.dart';

class BrandCategory extends StatelessWidget {
   BrandCategory({super.key});
  List<String> brandName =[
    "assets/Logo0.png",
    "assets/Logo1.png",
    "assets/Logo2.png",
    "assets/Logo3.png",
    "assets/Logo4.png",
    "assets/Logo5.png",
    
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            //Text
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                  child: Texts(data: "Top Brands",size: 20,fontweight: FontWeight.bold,)),
            ),





            //main Container
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: Sizes.screenHeight*0.20,

                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: GridView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: brandName.length,
                    shrinkWrap: true,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio:0.5,),
                      itemBuilder: (context,index){
                        return Cont(
                          height: 100,
                            borderRadius: 20,
                            blurRadius: 1,
                            spreadRadius: 0.3,
                            borderWidth: 2,

                            color: Colors.white70,
                            child: Center(child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      brandName[index]),
                                ))));
                      }),
                ),
              ),
            ),
            Texts(
              leftPadding: 10,topPadding: 10,
              data: "New Arrivals",
              size: 25,
              fontweight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
