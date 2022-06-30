import 'package:flutter/material.dart';

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

