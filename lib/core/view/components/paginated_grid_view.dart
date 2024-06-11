import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../views.dart';

import '../../base/models/pagination_model.dart';
import '../../services/error/failure.dart';
import '../../utils/alerts.dart';

class PaginatedGridView<T> extends StatefulWidget {
  final Future<dartz.Either<Failure, PaginationModel<T>>> Function(int page) fetchData;
  final void Function(List<T> items) onGridItemsChange;
  final Widget Function(int index) child;
  final EdgeInsetsGeometry padding;
  final bool fetchOnScrollToMaxExtent;
  final double aspectRatio;
  final bool shrinkWrap;
  final ScrollController? scrollController;

  const PaginatedGridView({
    required this.fetchData,
    required this.onGridItemsChange,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.fetchOnScrollToMaxExtent = true,
    required this.aspectRatio,
    this.shrinkWrap = false,
    this.scrollController,
    super.key,
  });

  @override
  State<PaginatedGridView> createState() => _PaginatedGridViewState<T>();
}

class _PaginatedGridViewState<T> extends State<PaginatedGridView<T>> {
  bool isLoading = false;
  int page = 1;
  bool canFetchMore = true;
  late final ScrollController scrollController;
  final List<T> gridItems = [];

  @override
  void initState() {
    super.initState();
    setupController();
    getData(firstFetch: true);
  }

  void setupController() {
    scrollController = widget.scrollController ?? ScrollController();
    if (widget.fetchOnScrollToMaxExtent && mounted) {
      scrollController.addListener(() {
        final bool atEdge = scrollController.position.atEdge;
        if (atEdge && scrollController.position.pixels != 0 && canFetchMore) getData(firstFetch: false);
      });
    }
  }

  Future<void> getData({required bool firstFetch}) async {
    if (firstFetch) {
      page = 1;
      canFetchMore = true;
    }
    if (isLoading || !canFetchMore) return;
    if (page == 0) widget.onGridItemsChange([]);
    setState(() => isLoading = true);
    final dartz.Either<Failure, PaginationModel<T>> result = await widget.fetchData(page);
    result.fold(
      (failure) => Alerts.showSnackBar(
        message: failure.message,
        onActionPressed: () => getData(firstFetch: firstFetch),
      ),
      (paginationModel) {
        setState(() => gridItems.addAll(paginationModel.data));
        page++;
        // if (paginationModel.nextPage == null) canFetchMore = false;
        canFetchMore = false;
        widget.onGridItemsChange(gridItems);
      },
    );
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading && page == 1) return const LoadingSpinner();

    final bool isFetchingData = isLoading && page != 1;
    return GridView.builder(
      controller: scrollController,
      padding: widget.padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSize.s12,
        mainAxisSpacing: AppSize.s12,
        childAspectRatio: widget.aspectRatio,
      ),
      itemBuilder: (context, index) => widget.child(index),
      itemCount: gridItems.length,
    );
  }
}
