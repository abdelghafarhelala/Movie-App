import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

Widget buildNoItemDynamic(
        {required String message,
        required String imagePath,
        required BuildContext context}) =>
    Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.sizeOf(context).height * 0.65),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Lottie.asset(imagePath),
          const SizedBox(
            height: 10,
          ),
          Text(
            // S.of(context).noProductsInCart,
            message,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          )
        ],
      ),
    );
