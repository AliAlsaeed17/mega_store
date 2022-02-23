import 'package:flutter/material.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/views/widgets/custom_button.dart';
import 'package:mega_store/views/widgets/custom_text.dart';

List<String> names = [
  "ali",
  "ali",
  "ali",
  "ali",
  "ali",
];
List<String> images = [
  "assets/images/chaire.png",
  "assets/images/chaire.png",
  "assets/images/chaire.png",
  "assets/images/chaire.png",
  "assets/images/chaire.png",
];
List<int> prices = [
  600,
  100,
  900,
  600,
  200,
];

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15);
                },
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Image.asset(images[index]),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: names[index],
                                fontSize: 24,
                              ),
                              SizedBox(height: 7),
                              CustomText(
                                text: "\$${prices[index].toString()}",
                                color: kPrimaryColor,
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 120,
                                height: 40,
                                color: Colors.grey.shade200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 20),
                                    CustomText(
                                      text: "1",
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.minimize,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "TOTAL",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: "\$2000",
                      color: kPrimaryColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                Container(
                  height: 80,
                  width: 120,
                  padding: EdgeInsets.all(3),
                  child: CustomButton(
                    text: "CHECHOUT",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
