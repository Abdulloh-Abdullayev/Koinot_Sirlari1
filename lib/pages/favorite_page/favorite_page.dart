import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:koinotsirlari/pages/detail_page/detail_page.dart';
import 'package:koinotsirlari/models/object_models.dart';
import 'package:koinotsirlari/views/background_image.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);
  static const String id = "FavoritePage";

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favorite.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF253341),
        elevation: 0,
        centerTitle: true,
        title: const Text("Barchasi",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,fontFamily: 'Poppins'),),
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
                      itemCount: favorite.length,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(link: favorite[index],)
                                  )
                              );
                            },
                            child: Card(
                              color: Color(0xFF253341),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl: favorite[index]["image"].toString(), fit: BoxFit.cover,
                                      placeholder: (context, url) => const CupertinoActivityIndicator(),
                                      errorWidget: (context, url, error) => const Icon(Icons.light),),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 10,bottom: 6),
                                    height: 50,
                                    child: Text(favorite[index]["name"].toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Poppins'),),
                                  )
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
    );
  }
}
