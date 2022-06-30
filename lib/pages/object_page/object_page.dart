import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:koinotsirlari/core/constants/color_const.dart';
import 'package:koinotsirlari/core/constants/fontFamily_const.dart';
import 'package:koinotsirlari/pages/detail_page/detail_page.dart';
import 'package:koinotsirlari/views/background_image.dart';

class NebulasPage extends StatefulWidget {
   final List data;
   const NebulasPage({Key? key, required this.data}) : super(key: key);
  static const String id = "NebulasPage";

   @override
   _NebulasPageState createState() => _NebulasPageState();
}

class _NebulasPageState extends State<NebulasPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.asosiyRang,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title:  Text("Explores",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,fontFamily: FontFamilyConst.poppins),),
      ),
      body: Stack(
        children: [

          buildBackgroundImage(),

          FlipInX(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child:  MasonryGridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: widget.data.length,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(link: widget.data[index],)
                                  )
                              );
                            },
                            child: Card(
                              color: ColorConst.asosiyRang,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      ClipRRect(
                                        child: CachedNetworkImage(
                                          imageUrl: widget.data[index]["image"].toString(), fit: BoxFit.cover,
                                          placeholder: (context, url) => const CupertinoActivityIndicator(),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.only(left: 10,bottom: 6),
                                        height: 50,
                                        child: Text(widget.data[index]["name"].toString(),style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: FontFamilyConst.poppins),),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
