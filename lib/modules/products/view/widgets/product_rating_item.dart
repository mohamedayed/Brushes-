import 'package:brushes/core/view/views.dart';
import 'package:brushes/core/view/widgets/custom_text.dart';
import 'package:brushes/core/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';

class ProductRatingItem extends StatelessWidget {
  const ProductRatingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.network(
                "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2022/10/09/16653331196722.jpg",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Yousef hamza", style: Theme.of(context).textTheme.bodyMedium),
                  Text("5 July 2022", style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
            ),
            SizedBox(width: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
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
            )
          ],
        ),
        SizedBox(height: 12),
        CustomText("dsjfbdhgf kjsfhjdhgf sdfsfdg sg dfjhgdgfh d dfkjdfjbd dkfndkf qlwwodwifek dkjfndkv"),
      ],
    );
  }
}
