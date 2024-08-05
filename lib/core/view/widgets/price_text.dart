import '../../../config/localization/l10n/l10n.dart';
import '../../resources/resources.dart';
import '../../utils/globals.dart';
import '../views.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double myPrice;
  final String zeroPlaceholder;
  final double textSizeFactor;
  final TextDecoration? textDecoration;

  const PriceWidget({
    required this.myPrice,
    this.zeroPlaceholder = '-',
    this.textSizeFactor = 1.0,
    this.textDecoration,
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
          decoration: textDecoration,
          color: AppColors.primary,
          fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
        ),
        children: <TextSpan>[
          TextSpan(
            text: myPrice.toStringAsFixed(configs.value?.defaultCurrencyDecimalDigits ?? 0),
            style: TextStyle(
              fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
              fontWeight: FontWeightManager.bold,
              fontSize: FontSize.s16 * textSizeFactor,
            ),
          ),
          if (configs.value?.defaultCurrency != null)
            TextSpan(
              text: "${configs.value?.defaultCurrency}",
              style: TextStyle(
                fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
                fontWeight: FontWeightManager.bold,
                fontSize: FontSize.s12 * textSizeFactor,
              ),
            ),
        ],
      ),
    );
  }
}
