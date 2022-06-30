import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koinotsirlari/core/constants/color_const.dart';
import 'package:koinotsirlari/pages/control_page/control_page_controller.dart';
import 'package:koinotsirlari/pages/favorite_page/favorite_page.dart';
import 'package:koinotsirlari/pages/home_page/home_page.dart';
import 'package:koinotsirlari/pages/tafakkur_page/tafakkur_page.dart';
import 'package:koinotsirlari/views/background_image.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);
  static const String id = "ControlPage";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ControlPageController(),
        builder: (ControlPageController controller) {
          return Scaffold(
              body: Stack(
            children: [

              buildBackgroundImage(),

              PageView(
                physics: const NeverScrollableScrollPhysics(),
                pageSnapping: true,
                padEnds: false,
                controller: controller.pageController,
                children: const [
                  HomePage(),
                  FavoritePage(),
                  SettingPage(),
                ],
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 55,
                      margin: const EdgeInsets.only(
                        left: 100,
                      ),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        //color: Colors.white
                      ),
                      child: Card(
                        color: ColorConst.asosiyRang2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 10,
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  controller.selectedIndex = 0;
                                  controller.update();
                                  controller.homeButton();

                                },
                                icon: Icon(Icons.dark_mode,size: 30,
                                    color: controller.selectedIndex == 0
                                        ? ColorConst.yellow
                                        : ColorConst.white
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  controller.selectedIndex = 1;
                                  controller.update();
                                  controller.homeButton();
                                },
                                icon: Icon(
                                  Icons.favorite,size: 30,
                                  color: controller.selectedIndex == 1
                                      ? ColorConst.yellow
                                      : ColorConst.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  controller.selectedIndex = 2;
                                  controller.update();
                                  controller.homeButton();
                                },
                                icon: Icon(Icons.bookmark,size: 30,
                                    color: controller.selectedIndex == 2
                                        ? ColorConst.yellow
                                        : ColorConst.white
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ));
        });
  }
}
