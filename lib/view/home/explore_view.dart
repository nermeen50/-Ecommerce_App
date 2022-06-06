import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const CustomTextField(
              hint: "Search product",
              prefixIcon: Icon(Icons.search),
              hasBorder: true),
          const SizedBox(height: 30),
          const CustomText(
              text: "Categories", fontWeight: FontWeight.w300, fontSize: 20),
          Expanded(
            flex: 2,
            child: ListView.separated(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child:
                              Image.asset("assets/images/Icon_Mens Shoe.png")),
                      const CustomText(text: "Categories"),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 20)),
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                    text: "Best Selling",
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
                CustomText(
                    text: "See All", fontWeight: FontWeight.w300, fontSize: 20),
              ]),
          const SizedBox(height: 30),
          Expanded(
            flex: 4,
            child: ListView.separated(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset("assets/images/chaire.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                      const CustomText(
                          text: "Categories", fontWeight: FontWeight.bold),
                      const CustomText(
                          text: "Categories", color: Colors.grey, fontSize: 13),
                      const SizedBox(height: 10),
                      CustomText(
                          text: "\$5.0",
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 20)),
          ),
        ],
      ),
    );
  }
}
