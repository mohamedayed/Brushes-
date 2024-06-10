import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/core/view/widgets/custom_text.dart';
import 'package:brushes/core/view/widgets/custom_text_button.dart';
import 'package:brushes/modules/products/controller/product_details_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../widgets/product_rating_item.dart';

class ProductDetailsScreen extends GetWidget<ProductDetailsController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.productDetails.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            Divider(height: AppSize.s1),
            Obx(() {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Time.t5s,
                        height: 360,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) => controller.currentSlide.value = index,
                      ),
                      items: List.generate(
                        5,
                        (index) => CustomImage(
                          image: "https://m.media-amazon.com/images/I/81OweSxsUGL.jpg",
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: ShapeDecoration(color: AppColors.grey100, shape: StadiumBorder()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        5,
                        (index) => Container(
                          width: 5.0,
                          height: 5.0,
                          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: controller.currentSlide.value == index
                                ? Theme.of(context).colorScheme.primary
                                : AppColors.gray300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            Divider(height: AppSize.s1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Braun Series 3 Wet & Dry Electric Shaver - 3010S",
                    textAlign: TextAlign.start,
                    fontWeight: FontWeightManager.semiBold,
                    fontSize: FontSize.s16,
                  ),
                  CustomText(
                    "25 EGP",
                    fontWeight: FontWeightManager.bold,
                    fontSize: FontSize.s16,
                  ),
                  Row(
                    children: [
                      Text("5.0", style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(width: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => index < 3
                              ? Icon(Icons.star, size: 16, color: Color(0xFFFFB24D))
                              : Icon(Icons.star, size: 16, color: AppColors.gray300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description"),
                  SizedBox(height: 4),
                  Text(
                    "hdfgdfjd dkfdjfdhfgjd dhfdfgvdhfvh djhhfvdvfdhgf sjhsvhjacjadheljkbf hfbd kfbdhfgduf dkjfbdjhf hdfgdfjd dkfdjfdhfgjd dhfdfgvdhfvh djhhfvdvfdhgf sjhsvhjacjadheljkbf hfbd kfbdhfgduf dkjfbdjhf",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ratings"),
                  SizedBox(height: 4),
                  ProductRatingItem(),
                  SizedBox(height: 14),
                  ProductRatingItem(),
                  SizedBox(height: 14),
                  ProductRatingItem(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color(0xff8C88AF).withOpacity(0.07), blurRadius: 20)],
            ),
            padding: EdgeInsets.all(20),
            child: CustomButton(text: "Buy Product", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
