import 'package:flutter/material.dart';
import 'package:shopIT/Utils/Components/Size.dart';
import 'package:shopIT/Utils/Custom_Widgets/Text.dart';

import '../../Utils/Custom_Widgets/Container.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Cont(
        height: Sizes.screenHeight*0.60,
        color: Colors.blue, child: Texts(),
      ),
    );
  }
}
