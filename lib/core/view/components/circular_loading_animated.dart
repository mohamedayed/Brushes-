import 'dart:async';

import '../../resources/app_values.dart';
import '../views.dart';
import 'package:flutter/material.dart';

class CircularLoadingAnimated extends StatefulWidget {
  final double height;
  final ValueChanged<void> onComplete;
  final String onCompleteText;

  const CircularLoadingAnimated({
    super.key,
    this.height = AppSize.s125,
    required this.onComplete,
    required this.onCompleteText,
  });

  @override
  State<CircularLoadingAnimated> createState() => _CircularLoadingAnimatedState();
}

class _CircularLoadingAnimatedState extends State<CircularLoadingAnimated> with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController animationController;

  void initState() {
    super.initState();
    animationController = AnimationController(duration: Time.t300ms, vsync: this);
    CurvedAnimation curve = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween<double>(begin: widget.height, end: 0).animate(curve)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    Timer(Duration(seconds: 10), () {
      if (mounted) {
        animationController.forward();
      }
      widget.onComplete;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return animationController.isCompleted
        ? SizedBox(
            height: widget.height,
            child: Center(child: CustomText(widget.onCompleteText)),
          )
        : Opacity(
            opacity: animation.value / 100 > 1.0 ? 1.0 : animation.value / 100,
            child: SizedBox(height: animation.value, child: LoadingSpinner()),
          );
  }
}
