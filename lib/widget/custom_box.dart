import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
    Key? key,
    this.iconData,
    this.title,
    this.subTitle,
    this.isImage = false,
  }) : super(key: key);
  final IconData? iconData;
  final String? title;
  final String? subTitle;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 7,
                spreadRadius: 0.3)
          ]),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Icon(
                iconData ?? CupertinoIcons.money_dollar_circle,
                color: Colors.green,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title ?? "0.00",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    subTitle ?? "Total Amount",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
