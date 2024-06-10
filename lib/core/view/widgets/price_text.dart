import 'package:brushes/config/localization/l10n/l10n.dart';
import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/globals.dart';
import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double myPrice;
  final String zeroPlaceholder;

  const PriceWidget({
    required this.myPrice,
    this.zeroPlaceholder = '-',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (myPrice == 0) {
      return CustomText(zeroPlaceholder);
    }

    return RichText(
      softWrap: false,
      overflow: TextOverflow.fade,
      maxLines: 1,
      text: TextSpan(
        style: TextStyle(
          color: AppColors.primary,
          fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
        ),
        children: <TextSpan>[
          TextSpan(
            text: myPrice.toStringAsFixed(configs.value?.defaultCurrencyDecimalDigits ?? 0),
            style: TextStyle(
              fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
              fontWeight: FontWeightManager.bold,
            ),
          ),
          if (configs.value?.defaultCurrency != null)
            TextSpan(
              text: " ${configs.value?.defaultCurrency} ",
              style: TextStyle(
                fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
                fontWeight: FontWeightManager.bold,
              ),
            ),
        ],
      ),
    );
  }
}
