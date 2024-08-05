import '../../../../core/resources/resources.dart';
import '../../../../core/utils/dialogs.dart';
import '../../../../core/utils/globals.dart';
import '../../controller/account_controller.dart';
import '../../../home/view/components/notifications_button_widget.dart';
import '../../../layout/controller/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/view/views.dart';
import '../widgets/account_tile.dart';

class AccountScreen extends GetWidget<AccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppbar(showDefaultBackButton: false, title: AppStrings.account.tr),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                VerticalSpace(18),
                CustomImage(image: currentUser.value!.avatar.url, width: 120, height: 120, borderRadius: 250),
                VerticalSpace(10),
                CustomText(currentUser.value!.name, fontWeight: FontWeightManager.bold),
                VerticalSpace(4),
                CustomText(currentUser.value!.email, fontWeight: FontWeightManager.light),
                VerticalSpace(8),
                CustomButton(
                  width: MediaQuery.of(context).size.width * 0.6,
                  isOutlined: true,
                  textColor: AppColors.black,
                  text: AppStrings.profile.tr,
                  onPressed: () => Get.toNamed(Routes.profileScreen),
                ),
                Divider(height: AppSize.s32, thickness: 5, color: AppColors.grey100),
                AccountTile(
                  icon: AppIcons.todoFilled,
                  title: AppStrings.myBookings.tr,
                  onTap: () => Get.find<LayoutController>().setIndex(2),
                ),
                VerticalSpace(10),
                AccountTile(
                  icon: AppIcons.bellFilled,
                  title: AppStrings.notifications.tr,
                  onTap: () => Get.toNamed(Routes.notificationsScreen),
                ),
                VerticalSpace(10),
                AccountTile(
                  icon: AppIcons.messagesFilled,
                  title: AppStrings.messages.tr,
                  onTap: () => Get.find<LayoutController>().setIndex(3),
                ),
                Divider(height: AppSize.s32, thickness: 5, color: AppColors.grey100),
                AccountTile(
                  icon: AppIcons.heartFilled,
                  title: AppStrings.favourites.tr,
                  onTap: () => Get.toNamed(Routes.favouritesScreen),
                ),
                VerticalSpace(10),
                AccountTile(icon: AppIcons.bagFilled, title: AppStrings.orders.tr, onTap: () {}),
                VerticalSpace(10),
                AccountTile(
                  icon: AppIcons.location,
                  title: AppStrings.addresses.tr,
                  onTap: () => Get.toNamed(Routes.addressesScreen),
                ),
                VerticalSpace(10),
                AccountTile(icon: AppIcons.walletFilled, title: AppStrings.wallet.tr, onTap: () {}),
                VerticalSpace(10),
                AccountTile(
                  icon: AppIcons.languageFilled,
                  title: AppStrings.languages.tr,
                  onTap: () => Get.toNamed(Routes.languageScreen),
                ),
                VerticalSpace(10),
                AccountTile(
                  icon: AppIcons.themeFilled,
                  title: AppStrings.themeMode.tr,
                  onTap: () => Get.toNamed(Routes.themeScreen),
                ),
                VerticalSpace(10),
                AccountTile(
                  icon: AppIcons.ppFilled,
                  title: AppStrings.privacyPolicy.tr,
                  onTap: () => Get.toNamed(Routes.privacyPolicyScreen),
                ),
                VerticalSpace(10),
                AccountTile(
                  icon: AppIcons.logout,
                  title: AppStrings.logout.tr,
                  onTap: () => AppDialogs.showAppDialog(
                    context,
                    dialog: ConfirmationDialog(title: AppStrings.logoutHint.tr, onYes: controller.signOut),
                  ),
                ),
                VerticalSpace(32),
                Divider(height: 1, thickness: 20, color: AppColors.grey100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
