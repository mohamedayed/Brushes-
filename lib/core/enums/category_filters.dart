import 'package:brushes/core/resources/resources.dart';
import 'package:get/get.dart';

enum CategoryFilter { all, availability, rating, featured, popular }

extension CategoryFilterExtension on CategoryFilter {
  Map<String, dynamic> queryParameters(int categoryId) {
    switch (this) {
      case CategoryFilter.all:
        return {
          'with': 'categories;options;options.media;salon.address',
          'search': 'categories.id:$categoryId',
          'searchFields': 'categories.id:=',
          'searchJoin': 'and',
        };
      case CategoryFilter.availability:
        return {
          'with': 'salon;salon.address;categories',
          'search': 'categories.id:$categoryId',
          'searchFields': 'categories.id:=',
          'available_salon': 'true',
        };
      case CategoryFilter.rating:
        return {
          'with': 'salon;salon.address;categories',
          'search': 'categories.id:$categoryId',
          'searchFields': 'categories.id:=',
          'rating': 'true',
        };
      case CategoryFilter.featured:
        return {
          'with': 'salon;salon.address;categories',
          'search': 'categories.id:$categoryId;featured:1',
          'searchFields': 'categories.id:=;featured:=',
          'searchJoin': 'and'
        };
      case CategoryFilter.popular:
        return {
          'with': 'salon;salon.address;categories',
          'search': 'categories.id:$categoryId',
          'searchFields': 'categories.id:=',
          'rating': 'true'
        };
    }
  }

  String get tabText {
    switch (this) {
      case CategoryFilter.all:
        return AppStrings.all.tr;
      case CategoryFilter.availability:
        return AppStrings.availability.tr;
      case CategoryFilter.rating:
        return AppStrings.rating.tr;
      case CategoryFilter.featured:
        return AppStrings.featured.tr;
      case CategoryFilter.popular:
        return AppStrings.popular.tr;
    }
  }
}
