import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'main.dart';
import 'detailview.dart';

class Ebook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: SingleChildScrollView (
            child: Column(
              children: [
                const SizedBox(height: 40.0,child: Text("Favorite",style: TextStyle(fontSize: 20),),),
                SizedBox(
                  height: 300,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        // width: 160.0,

                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/85437_48595_normal.jpg?width=200'),
                        ),



                      ),
                      Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/118215_13484_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/90294_51440_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/99473_44720_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/100102_63516_normal.jpg?width=200'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0,child: Text("new releases",style: TextStyle(fontSize: 20),),),
                SizedBox(
                  height: 300,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        // width: 160.0,
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/69380_61867_normal.jpg?width=200'),
                        ),


                      ),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/69569_47206_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/118203_76231_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/109673_93017_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/98322_90207_normal.jpg?width=200'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0,child: Text("top selling",style: TextStyle(fontSize: 20),),),
                SizedBox(
                  height: 300,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        // width: 160.0,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/69459_83225_normal.jpg?width=200'),
                        ),

                      ),
                      Container(
                        child:  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/70526_64499_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/1998_41564_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/62989_77673_normal.jpg?width=200'),
                        ),
                      ),
                      Container(
                        child:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                          },
                          child: Image.network('https://newcdn.fidibo.com/images/books/113320_76086_normal.jpg?width=200'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // backgroundColor: Colors.tealAccent,
        );
    throw UnimplementedError();
  }

}