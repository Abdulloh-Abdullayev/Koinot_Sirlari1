import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

  Widget buildBackgroundImage() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.jpg'),
            fit: BoxFit.cover,
          )
      ),
    );
  }

