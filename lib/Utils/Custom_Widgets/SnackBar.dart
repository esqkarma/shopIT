import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Screens/Home/Bloc/home_bloc.dart';


class SnackBarHelper {
  static void showAddToCartSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Item Added to cart"),
            TextButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(HomeToCartNavigateEvent());
              },
              child: const Text(
                "View cart",
                style: TextStyle(color: Colors.orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
