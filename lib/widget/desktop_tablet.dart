import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'graph.dart';
import 'custom_box.dart';

class DesktopAndTablet extends StatelessWidget {
  const DesktopAndTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: Get.height,
      child: SingleChildScrollView(
          child: Column(
        children: [
          const Padding(
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: const [
                Expanded(
                    flex: 15,
                    child: CustomBox(
                      iconData: CupertinoIcons.ticket_fill,
                      subTitle: "UT",
                      title: "1,000,000",
                    )),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: CustomBox(),
                ),
              ],
            ),
          ),
          MyHomePage()
        ],
      )),
    );
  }
}
