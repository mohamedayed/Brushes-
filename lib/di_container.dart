import 'package:brushes/core/services/address/address_service.dart';
import 'package:brushes/modules/account/controller/account_controller.dart';
import 'package:brushes/modules/auth/controller/social_auth_controller.dart';
import 'package:brushes/modules/auth/repositories/social_auth_repo.dart';
import 'package:brushes/modules/booking/controller/booking_rating_controller.dart';
import 'package:brushes/modules/booking/controller/booking_summary_controller.dart';
import 'package:brushes/modules/booking/controller/my_bookings_controller.dart';
import 'package:brushes/modules/categories/controller/category_services_controller.dart';
import 'package:brushes/modules/checkout/controller/checkout_controller.dart';
import 'package:brushes/modules/checkout/repositories/checkout_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'config/configs/configs_repo.dart';
import 'config/localization/controller/l10n_controller.dart';
import 'core/services/local/cache_client.dart';
import 'core/services/network/api_client.dart';
import 'core/services/network/network_info.dart';

import 'modules/addresses/repositories/addresses_repo.dart';
import 'modules/auth/repositories/auth_repo.dart';
import 'modules/booking/repositories/booking_repo.dart';
import 'modules/categories/repositories/categories_repo.dart';
import 'modules/chat/repositories/chat_repo.dart';
import 'modules/booking/repositories/book_e_service_repo.dart';
import 'modules/e_service/repositories/e_service_repo.dart';
import 'modules/favourites/repositories/favourites_repo.dart';
import 'modules/home/repositories/home_repo.dart';
import 'modules/info_pages/repositories/info_pages_repo.dart';
import 'modules/notifications/repositories/notifications_repo.dart';
import 'modules/products/repositories/products_repo.dart';
import 'modules/profile/repositories/profile_repo.dart';
import 'modules/salon/repositories/salon_repo.dart';
import 'modules/search/repositories/search_repo.dart';

import 'modules/layout/controller/layout_controller.dart';
import 'modules/addresses/controller/addresses_controller.dart';
import 'modules/auth/controller/forget_password_controller.dart';
import 'modules/auth/controller/new_password_controller.dart';
import 'modules/auth/controller/otp_controller.dart';
import 'modules/auth/controller/password_changed_controller.dart';
import 'modules/auth/controller/sign_in_controller.dart';
import 'modules/auth/controller/sign_up_controller.dart';
import 'modules/booking/controller/booking_details_controller.dart';
import 'modules/categories/controller/categories_controller.dart';
import 'modules/chat/controller/chat_controller.dart';
import 'modules/booking/controller/book_service_controller.dart';
import 'modules/e_service/controller/e_service_details_controller.dart';
import 'modules/favourites/controller/favourites_controller.dart';
import 'modules/home/controller/home_controller.dart';
import 'modules/info_pages/controller/privacy_policy_controller.dart';
import 'modules/notifications/controller/notifications_controller.dart';
import 'modules/products/controller/buy_product_controller.dart';
import 'modules/products/controller/product_details_controller.dart';
import 'modules/profile/controller/profile_controller.dart';
import 'modules/salon/controller/employee_details_controller.dart';
import 'modules/salon/controller/salon_details_controller.dart';
import 'modules/search/controller/search_controller.dart' as sc;
import 'modules/settings/controller/theme_controller.dart';
import 'modules/splash/controller/splash_controller.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // external
  await GetStorage.init();
  sl.registerLazySingleton<GetStorage>(() => GetStorage());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<PrettyDioLogger>(
      () => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));

  // core
  sl.registerLazySingleton<CacheClient>(() => CacheClient(sl<GetStorage>()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>(), sl<CacheClient>(), sl<PrettyDioLogger>()));
  sl.registerLazySingleton<AddressService>(() => AddressService(sl<CacheClient>()));

  // Repositories
  sl.registerLazySingleton<ConfigsRepo>(() => ConfigsRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<AddressesRepo>(() => AddressesRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(sl<ApiClient>(), sl<CacheClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<SocialAuthRepo>(() => SocialAuthRepo(sl<ApiClient>(), sl<CacheClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<BookingRepo>(() => BookingRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<CheckoutRepo>(() => CheckoutRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<ChatRepo>(() => ChatRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<EServiceRepo>(() => EServiceRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<FavouritesRepo>(() => FavouritesRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<InfoPagesRepo>(() => InfoPagesRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<NotificationsRepo>(() => NotificationsRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<ProductsRepo>(() => ProductsRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<SalonRepo>(() => SalonRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<SearchRepo>(() => SearchRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<BookEServiceRepo>(() => BookEServiceRepo(sl<ApiClient>(), sl<NetworkInfo>()));

  // Controllers
  sl.registerFactory<L10nController>(() => L10nController(sl<CacheClient>())..initLocale());
  sl.registerFactory<AddressesController>(() => AddressesController(sl<AddressesRepo>(), sl<AddressService>()));
  sl.registerFactory<ForgetPasswordController>(() => ForgetPasswordController(sl<AuthRepo>()));
  sl.registerFactory<NewPasswordController>(() => NewPasswordController(sl<AuthRepo>()));
  sl.registerFactory<OTPController>(() => OTPController(sl<AuthRepo>()));
  sl.registerFactory<PasswordChangedController>(() => PasswordChangedController(sl<AuthRepo>()));
  sl.registerFactory<SignInController>(() => SignInController(sl<AuthRepo>()));
  sl.registerFactory<SignUpController>(() => SignUpController(sl<AuthRepo>()));
  sl.registerFactory<SocialAuthController>(() => SocialAuthController(sl<SocialAuthRepo>()));
  sl.registerFactory<MyBookingsController>(() => MyBookingsController(sl<BookingRepo>()));
  sl.registerFactory<BookingDetailsController>(() => BookingDetailsController(sl<BookingRepo>()));
  sl.registerFactory<BookingSummaryController>(() => BookingSummaryController());
  sl.registerFactory<BookingRatingController>(() => BookingRatingController(sl<BookingRepo>()));
  sl.registerFactory<CategoriesController>(() => CategoriesController(sl<CategoriesRepo>()));
  sl.registerFactory<CategoryServicesController>(() => CategoryServicesController(sl<EServiceRepo>()));
  sl.registerFactory<ChatController>(() => ChatController(sl<ChatRepo>(), sl<NotificationsRepo>()));
  sl.registerFactory<BookServiceController>(() => BookServiceController(sl<BookEServiceRepo>()));
  sl.registerFactory<CheckoutController>(() => CheckoutController(sl<CheckoutRepo>(), sl<BookingRepo>()));
  sl.registerFactory<EServiceDetailsController>(() => EServiceDetailsController(sl<EServiceRepo>()));
  sl.registerFactory<FavouritesController>(() => FavouritesController(sl<FavouritesRepo>()));
  sl.registerFactory<HomeController>(() => HomeController(sl<HomeRepo>(), sl<CategoriesRepo>()));
  sl.registerFactory<PrivacyPolicyController>(() => PrivacyPolicyController(sl<InfoPagesRepo>()));
  sl.registerFactory<NotificationsController>(() => NotificationsController(sl<NotificationsRepo>()));
  sl.registerFactory<BuyProductController>(() => BuyProductController(sl<ProductsRepo>()));
  sl.registerFactory<ProductDetailsController>(() => ProductDetailsController(sl<ProductsRepo>()));
  sl.registerFactory<ProfileController>(() => ProfileController(sl<ProfileRepo>()));
  sl.registerFactory<EmployeeDetailsController>(() => EmployeeDetailsController(sl<SalonRepo>()));
  sl.registerFactory<SalonDetailsController>(() => SalonDetailsController(sl<CategoriesRepo>(), sl<SalonRepo>()));
  sl.registerFactory<sc.SearchController>(() => sc.SearchController(sl<SearchRepo>(), sl<CategoriesRepo>()));
  sl.registerFactory<ThemeController>(() => ThemeController());
  sl.registerFactory<LayoutController>(() => LayoutController(sl<NotificationsRepo>(), sl<AddressService>()));
  sl.registerFactory<SplashController>(() => SplashController(sl<ConfigsRepo>(), sl<ProfileRepo>(), sl<AuthRepo>()));
  sl.registerFactory<AccountController>(() => AccountController(sl<AuthRepo>()));
}
