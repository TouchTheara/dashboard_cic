import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_box.dart';

class Mobile extends StatelessWidget {
  const Mobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Live Dashboard",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: CustomBox(
                iconData: CupertinoIcons.ticket_fill,
                subTitle: "UT",
                title: "1,000,000",
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CustomBox()),
        ],
      ),
    );
  }
}
