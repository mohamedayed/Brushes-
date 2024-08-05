import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/resources/resources.dart';
import '../../models/responses/review_model.dart';

class RatingItem extends StatelessWidget {
  final Review review;

  const RatingItem(this.review, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: AppColors.gray200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomImage(image: review.booking.user.avatar.url, height: 38, width: 38, borderRadius: 250),
              HorizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            review.booking.user.name,
                            maxLines: 1,
                            autoSized: true,
                          ),
                        ),
                        HorizontalSpace(4),
                        RatingBar(
                          initialRating: review.rate.toDouble(),
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.zero,
                          onRatingUpdate: (value) {},
                          itemSize: 20,
                          ratingWidget: RatingWidget(
                            full: const CustomIcon(Icons.star_rounded, size: 16, color: AppColors.ratingStar),
                            empty: const CustomIcon(Icons.star_outline_rounded, size: 16, color: AppColors.gray300),
                            half: const CustomIcon(Icons.star_half_rounded, size: 16),
                          ),
                        ),
                        HorizontalSpace(4),
                        CustomText(review.rate.toStringAsFixed(1), height: 0),
                      ],
                    ),
                    CustomText(
                      DateFormat("d MMMM y").format(review.createdAt),
                      color: AppColors.gray300,
                      fontSize: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
          VerticalSpace(10),
          CustomText(review.review)
        ],
      ),
    );
  }
}
