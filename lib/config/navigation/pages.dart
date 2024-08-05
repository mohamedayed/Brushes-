import '../../modules/booking/view/screens/booking_summary_screen.dart';
import '../../modules/categories/binding/category_services_binding.dart';
import '../../modules/categories/view/screens/category_services_screen.dart';
import '../../modules/checkout/binding/checkout_binding.dart';
import '../../modules/checkout/view/screens/chekout_screen.dart';
import '../../modules/salon/view/screens/salon_cart_screen.dart';
import 'package:get/get.dart';

import '../../modules/booking/binding/booking_summary_binding.dart';
import '../../modules/splash/binding/splash_binding.dart';
import '../../modules/settings/binding/theme_binding.dart';
import '../../modules/search/binding/search_binding.dart';
import '../../modules/salon/binding/employee_details_binding.dart';
import '../../modules/salon/binding/salon_details_binding.dart';
import '../../modules/profile/binding/profile_binding.dart';
import '../../modules/products/binding/buy_product_binding.dart';
import '../../modules/products/binding/product_details_binding.dart';
import '../../modules/notifications/binding/notifications_binding.dart';
import '../../modules/layout/binding/layout_binding.dart';
import '../../modules/info_pages/binding/privacy_policy_binding.dart';
import '../../modules/favourites/binding/favourites_binding.dart';
import '../../modules/booking/binding/book_service_binding.dart';
import '../../modules/e_service/binding/e_service_details_binding.dart';
import '../../modules/chat/binding/chat_binding.dart';
import '../../modules/categories/binding/categories_binding.dart';
import '../../modules/booking/binding/booking_details_binding.dart';
import '../../modules/auth/binding/forget_password_binding.dart';
import '../../modules/auth/binding/new_password_binding.dart';
import '../../modules/auth/binding/otp_binding.dart';
import '../../modules/auth/binding/password_changed_binding.dart';
import '../../modules/auth/binding/sign_in_binding.dart';
import '../../modules/auth/binding/sign_up_binding.dart';
import '../../modules/addresses/binding/addresses_binding.dart';

import '../../modules/splash/view/screens/splash_screen.dart';
import '../../modules/settings/view/screens/language_screen.dart';
import '../../modules/settings/view/screens/theme_screen.dart';
import '../../modules/search/view/screens/search_screen.dart';
import '../../modules/salon/view/screens/employee_details_screen.dart';
import '../../modules/salon/view/screens/salon_details_screen.dart';
import '../../modules/profile/view/screens/profile_screen.dart';
import '../../modules/products/view/screens/buy_product_screen.dart';
import '../../modules/products/view/screens/product_details_screen.dart';
import '../../modules/notifications/view/screens/notifications_screen.dart';
import '../../modules/layout/view/screens/layout_screen.dart';
import '../../modules/info_pages/view/screens/privacy_policy_screen.dart';
import '../../modules/favourites/view/screens/favourites_screen.dart';
import '../../modules/booking/view/screens/book_service_screen.dart';
import '../../modules/e_service/view/screens/e_service_details_screen.dart';
import '../../modules/chat/view/screens/chat_screen.dart';
import '../../modules/categories/view/screens/categories_screen.dart';
import '../../modules/booking/view/screens/booking_details_screen.dart';
import '../../modules/auth/view/screens/forget_password_screen.dart';
import '../../modules/auth/view/screens/new_password_screen.dart';
import '../../modules/auth/view/screens/otp_screen.dart';
import '../../modules/auth/view/screens/password_changed_screen.dart';
import '../../modules/auth/view/screens/sign_in_screen.dart';
import '../../modules/auth/view/screens/sign_up_screen.dart';
import '../../modules/addresses/view/screens/addresses_screen.dart';
import '../../core/view/screens/choose_on_map_screen.dart';
import '../../core/view/screens/image_screen.dart';
import '../../core/view/screens/success_screen.dart';

import 'navigation.dart';

class Pages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.splashScreen,
      binding: SplashBinding(),
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => const SignInScreen(),
      bindings: [SignInBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => const SignUpScreen(),
      bindings: [SignUpBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => const ForgetPasswordScreen(),
      bindings: [ForgetPasswordBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.otpScreen,
      binding: OtpBinding(),
      page: () => const OtpScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.newPasswordScreen,
      binding: NewPasswordBinding(),
      page: () => const NewPasswordScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.passwordChangedScreen,
      binding: PasswordChangedBinding(),
      page: () => const PasswordChangedScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.layoutScreen,
      page: () => const LayoutScreen(),
      bindings: [LayoutBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.searchScreen,
      page: () => const SearchScreen(),
      bindings: [SearchBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.categoriesScreen,
      page: () => const CategoriesScreen(),
      bindings: [CategoriesBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.categoryServicesScreen,
      page: () => const CategoryServicesScreen(),
      bindings: [CategoryServicesBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.salonDetailsScreen,
      binding: SalonDetailsBinding(),
      page: () => const SalonDetailsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.salonCartScreen,
      binding: SalonDetailsBinding(),
      page: () => const SalonCartScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.employeeDetailsScreen,
      binding: EmployeeDetailsBinding(),
      page: () => const EmployeeDetailsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.eServiceDetailsScreen,
      binding: ServiceDetailsBinding(),
      page: () => const EServiceDetailsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.bookServiceScreen,
      binding: BookServiceBinding(),
      page: () => const BookServiceScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.bookingSummaryScreen,
      binding: BookingSummaryBinding(),
      page: () => const BookingSummaryScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.checkoutScreen,
      binding: CheckoutBinding(),
      page: () => const CheckoutScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.bookingDetailsScreen,
      binding: BookingDetailsBinding(),
      page: () => const BookingDetailsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.productDetailsScreen,
      binding: ProductDetailsBinding(),
      page: () => const ProductDetailsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.buyProductScreen,
      binding: BuyProductBinding(),
      page: () => const BuyProductScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.chatScreen,
      binding: ChatBinding(),
      page: () => const ChatScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.profileScreen,
      binding: ProfileBinding(),
      page: () => const ProfileScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.favouritesScreen,
      binding: FavouritesBinding(),
      page: () => const FavouritesScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.addressesScreen,
      binding: AddressesBinding(),
      page: () => const AddressesScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.themeScreen,
      binding: ThemeBinding(),
      page: () => const ThemeScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.languageScreen,
      page: () => const LanguageScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.privacyPolicyScreen,
      binding: PrivacyPolicyBinding(),
      page: () => const PrivacyPolicyScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.notificationsScreen,
      binding: NotificationsBinding(),
      page: () => const NotificationsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.imageScreen,
      page: () => const ImageScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.chooseOnMapScreen,
      page: () => const ChooseOnMapScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.successScreen,
      page: () => const SuccessScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
