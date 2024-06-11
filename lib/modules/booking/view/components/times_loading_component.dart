import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class TimesLoadingComponent extends StatelessWidget {
  const TimesLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s12),
        itemBuilder: (context, index) => Container(
          width: AppSize.s82,
          decoration: const BoxDecoration(color: AppColors.grey100, borderRadius: BorderRadius.all(Radius.circular(6))),
        ),
      ),
    );
  }
}
