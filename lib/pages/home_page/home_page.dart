import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:koinotsirlari/core/constants/color_const.dart';
import 'package:koinotsirlari/core/constants/fontFamily_const.dart';
import 'package:koinotsirlari/models/control_model.dart';
import 'package:koinotsirlari/pages/object_page/object_page.dart';
import 'package:koinotsirlari/views/background_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.asosiyRang,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Koinot Sirlari",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              fontFamily: FontFamilyConst.poppins),
        ),
      ),
      body: Stack(
        children: [
          buildBackgroundImage(),
          BounceInDown(
            child: ListView.builder(
              itemCount: allmodel.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NebulasPage(
                                    data: allmodel[index],
                                  )));
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Card(
                        color: ColorConst.asosiyRang,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 120,
                                  width: 120,
                                  child:
                                      Image.asset("assets/images/hubble.png"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                          left: 11.0, top: 8, bottom: 4),
                                      child: Text(
                                        name[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            fontFamily:
                                                FontFamilyConst.poppins),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                          left: 11.0, bottom: 8),
                                      child: Text(
                                        name[index].subtitle,
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: ColorConst.grey,
                                            fontFamily:
                                                FontFamilyConst.poppins),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
