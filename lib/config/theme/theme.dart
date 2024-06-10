import 'package:flutter/material.dart';

import '../../core/resources/resources.dart';

ThemeData lightTheme(BuildContext context) {
  bool isAr = true;

  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    canvasColor: AppColors.white,
    splashColor: AppColors.transparent,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      surfaceTint: AppColors.transparent,
    ),

    /// Badge
    badgeTheme: const BadgeThemeData(backgroundColor: AppColors.black),

    /// Bottom sheet
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.white),

    /// Appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: AppSize.s0,
      scrolledUnderElevation: AppSize.s0,
      iconTheme: IconThemeData(color: AppColors.black),
    ),

    /// Tabbar theme
    // tabBarTheme: TabBarTheme(
    //   indicatorColor: AppColors.primary,
    //   indicatorSize: TabBarIndicatorSize.tab,
    //   unselectedLabelColor: AppColors.unselectedTab,
    //   unselectedLabelStyle: TextStyle(
    //     fontWeight: FontWeightManager.regular,
    //     fontSize: FontSize.s14,
    //     fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
    //   ),
    //   labelColor: AppColors.black,
    //   labelStyle: TextStyle(
    //     fontWeight: FontWeightManager.regular,
    //     fontSize: FontSize.s14,
    //     fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
    //   ),
    // ),

    /// Divider theme
    // dividerColor: AppColors.divider,

    /// Progress indicator theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary),

    /// Icon theme
    iconTheme: const IconThemeData(color: AppColors.black),

    /// Divider theme
    dividerTheme: const DividerThemeData(thickness: 1, space: 1, color: AppColors.gray200),

    /// Bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.black,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: FontSize.s10,
        fontWeight: FontWeightManager.regular,
        fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
      ),
      unselectedItemColor: AppColors.bnbItem,
      unselectedLabelStyle: TextStyle(
        fontSize: FontSize.s10,
        fontWeight: FontWeightManager.regular,
        fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
      ),
    ),

    /// Text fields
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.black,
      labelStyle: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.s12,
        fontWeight: FontWeightManager.medium,
        fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
      ),
      hintStyle: TextStyle(
        color: AppColors.gray300,
        fontSize: FontSize.s14,
        height: 1,
        fontWeight: FontWeightManager.regular,
        fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
      ),
      contentPadding: const EdgeInsets.all(AppPadding.p12),
      errorStyle: TextStyle(
        fontSize: FontSize.s10,
        color: AppColors.warning,
        fontFamily: isAr ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
      ),
      errorMaxLines: 2,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gray250, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gray250, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.warning, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.warning, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
    ),
  );
}
