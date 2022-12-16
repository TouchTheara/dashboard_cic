import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightDesktop extends StatelessWidget {
  const RightDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Get.width * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
        child: Column(
          children: [
            const Text(
              "TOTAL AMOUNT RAISED",
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff152e6a),
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 80, left: 60),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "\$0",
                  style: TextStyle(
                      fontSize: 80,
                      color: Color(0xff152e6a),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Divider(
                thickness: 1.0,
                height: 3.0,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SizedBox(
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "NUMBER OF INVESTORS",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff152e6a),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 60,
                              color: Color(0xff152e6a),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      width: 2,
                      decoration: const BoxDecoration(
                          color: Colors.black, borderRadius: BorderRadius.zero),
                    ),
                    Column(
                      children: const [
                        Text(
                          "TOTAL UT SUBSCRIPBED",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff152e6a),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 60,
                              color: Color(0xff152e6a),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                    color: const Color(0XFFfafafa),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Price  per UT",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff152e6a),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "USD",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff152e6a),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        width: 2,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.zero),
                      ),
                      Column(
                        children: const [
                          Text(
                            "New UT issued",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff152e6a),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "UT",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff152e6a),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
