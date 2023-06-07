import 'package:flutter/material.dart';

import 'main.dart';
import 'detailview.dart';

class mybook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: myTheme,
      home: Scaffold(
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
                        child: Image.network('https://newcdn.fidibo.com/images/books/124385_39509_normal.jpg?width=200'),
                      ),



                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/122750_66609_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/122431_81561_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/124629_86934_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/121885_77791_normal.jpg?width=200'),
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
                        child: Image.network('https://newcdn.fidibo.com/images/books/121545_43927_normal.jpg?width=200'),
                      ),


                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/121977_10543_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/121762_93209_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/155342_47413_normal.jpg'),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/154979_80106_normal.jpg'),
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
                        child: Image.network('https://newcdn.fidibo.com/images/books/154621_10523_normal.jpg'),
                      ),

                    ),
                    Container(
                      child:  InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/154009_23229_normal.jpg'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/154172_20882_normal.jpg'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/153830_88644_normal.jpg'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/153141_24414_normal.jpg'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        //  backgroundColor: Colors.tealAccent,
      ),
    );
    throw UnimplementedError();
  }

}