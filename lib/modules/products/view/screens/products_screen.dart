import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../../home/view/components/notifications_button_widget.dart';
import '../widgets/products_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          showDefaultBackButton: false,
          title: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: AppStrings.searchProducts.tr,
                    prefix: const CustomIcon.svg(AppIcons.search),
                  ),
                ),
                const HorizontalSpace(AppSize.s8),
                const AspectRatio(aspectRatio: 1, child: NotificationsButtonWidget()),
              ],
            ),
          ),
        ),
        const VerticalSpace(AppSize.s8),
        const Divider(height: AppSize.s1),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) => ProductItem(index),
          ),
        ),
      ],
    );
  }
}
