import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ebook.dart';
import 'audiobook.dart';

class home extends StatelessWidget {
  CarouselController controller = CarouselController();
  late final WebViewController _controller;
  controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://flutter.dev'));
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: myAppbar(context),
          body:  SingleChildScrollView(
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
                          Ebook(),
                          audiobook(),
                          Icon(Icons.directions_bike),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),),
        );
    throw UnimplementedError();
  }
}
