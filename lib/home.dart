import 'dart:io';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ebook.dart';
import 'audiobook.dart';

class home extends StatelessWidget {

  final String name;
  final String favaudio;
  final String topselaudio;
  final String newaudio;
  final String favebook;
  final String topselebook;
  final String newebook;
  home({required this.name,required this.favaudio,required this.favebook,required this.newaudio,required this.newebook,required this.topselaudio , required this.topselebook});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: myTheme,
        home:Scaffold(
          appBar: myAppbar(context),
          body:  tabbarmessage(name: name,favaudio: favaudio,favebook: favebook,newaudio: newaudio,newebook: newebook,topselaudio: topselaudio,topselebook: topselebook),
        )
    );
    throw UnimplementedError();
  }
}

class tabbarmessage extends StatefulWidget{
  final String name;
  final String favaudio;
  final String topselaudio;
  final String newaudio;
  final String favebook;
  final String topselebook;
  final String newebook;
  tabbarmessage({required this.name,required this.favaudio,required this.favebook,required this.newaudio,required this.newebook,required this.topselaudio , required this.topselebook});
  @override
  State<StatefulWidget> createState() =>_tabbarmessagestate(name: name,favaudio: favaudio,favebook: favebook,newaudio: newaudio,newebook: newebook,topselaudio: topselaudio,topselebook: topselebook);

}
class _tabbarmessagestate extends State<tabbarmessage>{
  CarouselController controller = CarouselController();
  final String name;
  final String favaudio;
  final String topselaudio;
  final String newaudio;
  final String favebook;
  final String topselebook;
  final String newebook;
  _tabbarmessagestate({required this.name,required this.favaudio,required this.favebook,required this.newaudio,required this.newebook,required this.topselaudio , required this.topselebook});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 200.0,width: 2000.0,child: CarouselSlider(
            carouselController: controller ,

            options: CarouselOptions(height: 400.0,autoPlay: true,aspectRatio: 2.0,
              enlargeCenterPage: true,),
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  if(i==1) {
                    return Image.network('https://newcdn.fidibo.com/img/Slides/kelidar_5-6_WEB.jpg');
                  }
                  if(i==2) {
                    return  Image.network('https://newcdn.fidibo.com/img/Slides/nd-fidibook-lg.jpg');
                  }
                  if(i==3) {
                    return  Image.network('https://newcdn.fidibo.com/img/Slides/nd-fidiplus-lg.jpg');
                  }
                  if(i==4) {
                    return  Image.network('https://newcdn.fidibo.com/img/Slides/shakoori-sale.jpg');
                  }
                  if(i==5) {
                    return Image.network('https://newcdn.fidibo.com/img/Slides/nd-fidiplus-lg.jpg');
                  }
                  return  Image.network('https://newcdn.fidibo.com/img/Slides/nd-download-apps-lg.jpg');
                },
              );
            }).toList(),
          ),),
          SizedBox( height: 500,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                      //backgroundColor: Colors.teal,
                  bottom:  const TabBar(
                    tabs: [
                      Tab(icon: Text("Ebooks")),
                      Tab(icon: Text("Audiobooks")),
                      Tab(icon: Text("Mylibrary")),
                    ],
                  ),
                ),
                body:  TabBarView(
                  children: [
                    Ebook(name: name,fav: favebook,topsel:topselebook,newrelease:newebook),
                    audiobook(name: name,fav:favaudio,topsel:topselaudio,newrelease:newaudio),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
    throw UnimplementedError();
  }
}








