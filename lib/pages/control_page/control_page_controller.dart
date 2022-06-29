import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlPageController extends GetxController{

  PageController pageController = PageController(initialPage: 0);

  int selectedIndex = 0;

  void homeButton(){
    pageController.jumpToPage(selectedIndex);
    update();
  }


}