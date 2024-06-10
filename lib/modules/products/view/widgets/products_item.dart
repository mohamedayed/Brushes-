import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';

class ProductItem extends StatelessWidget {
  final int index;

  const ProductItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.productDetailsScreen),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: BorderDirectional(
            end: BorderSide(color: (index + 1) % 2 != 0 ? AppColors.grey100 : Colors.transparent),
            top: BorderSide(color: (index + 1) > 2 ? AppColors.grey100 : Colors.transparent),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: CustomImage(image: "https://m.media-amazon.com/images/I/81OweSxsUGL.jpg"),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "ماكينة الحلاقة الكهربائية Braun Series 3 للاستخدام الرطب والجاف - 3010S",
                    autoSized: true,
                    maxLines: 2,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      CustomText("5.0"),
                      SizedBox(width: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => CustomIcon(
                            Icons.star,
                            size: 16,
                            color: index < 3 ? AppColors.ratingStar : AppColors.gray250,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      CustomText("(39)", color: AppColors.gray300),
                    ],
                  ),
                  PriceWidget(myPrice: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
