import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:koinotsirlari/core/constants/color_const.dart';
import 'package:koinotsirlari/core/constants/fontFamily_const.dart';
import 'package:koinotsirlari/models/control_model.dart';
import 'package:koinotsirlari/views/background_image.dart';
import 'package:koinotsirlari/views/icon_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const String id = "SettingPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConst.asosiyRang,
        elevation: 0,
        title:  Text("Tafakkur", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, fontFamily: FontFamilyConst.poppins),),
        actions: [
          buildIconButton(),
          SizedBox(width: 5,)
        ],
      ),
      body: Stack(
        children: [
          buildBackgroundImage(),
          BounceInDown(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: tafakkur.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1),
                    child: Card(
                        color: ColorConst.asosiyRang,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: ExpansionTile(
                          collapsedTextColor: ColorConst.black,
                          title: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Image.asset("assets/images/hubble.png"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(8.0),
                                      child:  Text(
                                        tafakkur[index].title, style: TextStyle(
                                          color: ColorConst.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16, fontFamily: FontFamilyConst.poppins),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children:  [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Text(tafakkur[index].title.toString(),style: TextStyle(fontSize: 20,fontFamily: FontFamilyConst.poppins),),
                                  ),

                                  Text(tafakkur[index].subtitle.toString(),style: TextStyle(fontSize: 18,fontFamily: FontFamilyConst.poppins,color: Colors.grey.shade300)),

                                  SizedBox(height: 10,),

                                  Align(
                                    alignment: Alignment.centerRight,
                                   child: Text("www.islom.uz",style: TextStyle(fontSize: 16,fontFamily: FontFamilyConst.poppins)),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                    )
                  );
                }
              )
            ),
          ),
        ],
      ),
    );
  }
}
