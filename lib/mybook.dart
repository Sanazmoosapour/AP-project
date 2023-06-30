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
                  //children: ,
                ),
              ),
              const SizedBox(height: 40.0,child: Text("new releases",style: TextStyle(fontSize: 20),),),
              SizedBox(
                height: 300,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  //children: ,
                ),
              ),
              const SizedBox(height: 40.0,child: Text("top selling",style: TextStyle(fontSize: 20),),),
              SizedBox(
                height: 300,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  //children: ,
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