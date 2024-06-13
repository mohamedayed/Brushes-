import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class AccountTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const AccountTile({required this.icon, required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.gray200),
                borderRadius: BorderRadius.circular(6),
              ),
              child: SvgPicture.asset(icon, width: 18, height: 18),
            ),
            HorizontalSpace(10),
            Expanded(child: CustomText(title, fontSize: 12)),
            HorizontalSpace(4),
            CustomIcon(Icons.arrow_forward_ios, size: 16, color: AppColors.gray200),
          ],
        ),
      ),
    );
  }
}
