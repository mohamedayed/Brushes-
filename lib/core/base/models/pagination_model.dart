import '../../utils/json_utils.dart';

class PaginationModel<T> {
  final List<T> data;
  final int currentPage;
  final int totalItems;
  final int totalPage;
  final int nextPage;
  final int previousPage;
  final int lastPage;
  final int perPage;
  final String path;
  final dynamic currentList;
  final int from;
  final int to;
  final bool onFirstPage;
  final bool hasMorePages;
  final List<dynamic> links;

  PaginationModel({
    required this.data,
    required this.currentPage,
    required this.totalItems,
    required this.totalPage,
    required this.nextPage,
    required this.previousPage,
    required this.lastPage,
    required this.perPage,
    required this.path,
    required this.currentList,
    required this.from,
    required this.to,
    required this.onFirstPage,
    required this.hasMorePages,
    required this.links,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json, List<T> data) => PaginationModel(
        data: data,
        currentPage: JsonUtils.parseIntFromJson(json["current_page"]),
        totalItems: JsonUtils.parseIntFromJson(json["total_items"]),
        totalPage: JsonUtils.parseIntFromJson(json["total_page"]),
        nextPage: JsonUtils.parseIntFromJson(json["next_page"]),
        previousPage: JsonUtils.parseIntFromJson(json["previous_page"]),
        lastPage: JsonUtils.parseIntFromJson(json["last_page"]),
        perPage: JsonUtils.parseIntFromJson(json["per_page"]),
        path: JsonUtils.parseStringFromJson(json["path"]),
        currentList: json["current_list"],
        from: JsonUtils.parseIntFromJson(json["from"]),
        to: JsonUtils.parseIntFromJson(json["to"]),
        onFirstPage: json["on_first_page"] ?? false,
        hasMorePages: json["hasMorePages"] ?? false,
        links: List<dynamic>.from(json["links"].map((x) => x)),
      );
}
