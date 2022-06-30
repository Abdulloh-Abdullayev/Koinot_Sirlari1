import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:koinotsirlari/core/constants/color_const.dart';
import 'package:koinotsirlari/core/constants/fontFamily_const.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailPage extends StatefulWidget {
  Map<String,String>? link;
  DetailPage({Key? key,this.link}) : super(key: key);
  static const String id = "DetailPage";


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  void save() async {
    var status = await Permission.storage.request();
    if(status.isGranted){
      var response = await Dio().get(
          widget.link!['image'].toString(),
          options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: DateTime.now().toString());
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.asosiyRang,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlipInX(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: widget.link!['image'].toString(),fit: BoxFit.cover,
                      placeholder: (context, url) => const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    )),
              ),
            ),

            BounceInDown(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left: 12),
                  child: TextButton(
                    onPressed: (){
                      save();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Image dowloand")),
                      );

                    },
                    child: Text("Suratni yuklash",style: TextStyle(fontSize: 20,color: ColorConst.yellow,fontFamily: FontFamilyConst.poppins),),
                  ),
                ),
              ),
            ),

            BounceInDown(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
                child: Text(widget.link!['name'].toString(), style:  TextStyle( fontSize: 25,fontFamily: FontFamilyConst.poppins),),
              ),
            ),
            const Divider(color: Colors.transparent, height: 2,),
            BounceInDown(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.link!['description'].toString(),textAlign: TextAlign.start, style: TextStyle( fontSize: 18,fontFamily: FontFamilyConst.poppins,color: Colors.grey.shade300),),
            ),),
            const SizedBox(height: 20,)
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
      backgroundColor: ColorConst.white,
      onPressed: (){
        Navigator.pop(context);
      },
      child:  Icon(Icons.arrow_back,color: ColorConst.black,),
    ),
    );
  }
}



