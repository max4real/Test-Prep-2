import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMainController extends GetxController {
  final pageController = PageController();
  final selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
