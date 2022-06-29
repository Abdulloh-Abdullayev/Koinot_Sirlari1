import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:koinotsirlari/pages/control_page/control_page.dart';
import 'package:koinotsirlari/views/background_image.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String id = "SplashPage";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void openPage(){
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, ControlPage.id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundImage(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BounceInDown(
                    child: Column(
                      children: [

                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text("Tadqiqotlar",style: TextStyle(color: Colors.white,letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 30,fontFamily: "Poppins"),),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text("Nasa Hubble Space telescopi tomonidan amalga oshirilgan tadqiqotlar",style: TextStyle(color: Colors.white54, fontSize: 20,fontFamily: "Poppins"),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

