import 'dart:async';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'main.dart';
import 'detailview.dart';

class audiobook extends StatelessWidget{
  final String name;
  final String fav;
  final String topsel;
  final String newrelease;

  audiobook({required this.name,required this.fav,required this.newrelease, required this.topsel});
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
                  children: convertor(fav,context),
                ),
              ),
              const SizedBox(height: 40.0,child: Text("new releases",style: TextStyle(fontSize: 20),),),
              SizedBox(
                height: 300,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: convertor(newrelease,context),
                ),
              ),
              const SizedBox(height: 40.0,child: Text("top selling",style: TextStyle(fontSize: 20),),),
              SizedBox(
                height: 300,
                child: ListView(// This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: convertor(topsel,context),
                ),
              )
            ],
          ),
        ),
        // backgroundColor: Colors.tealAccent,
      ),
    );
    throw UnimplementedError();
  }

  List<InkWell> convertor(String data,BuildContext context){
    List<String> books=data.split("~~");


    List<InkWell> output=[];
    if(books.isEmpty)
      return output;
    for(int i=0;i<books.length;i++){
      if(books.elementAt(i).length==0)
        continue;
      print("books: "+books.elementAt(i));
      String bookname=books.elementAt(i).split("&&")[0];
      String image=books.elementAt(i).split("&&")[1];

      output.add(InkWell(
        onTap: () async {
          String book=await send(name,bookname);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview(username: name,book:book)));
        },
        child: Image.network(image),
      )
      );
    }

    return output;
  }
  Future<String> send(String username,String bookname) async{
    String requst="viewBook\nname:$username&&bookname:$bookname\u0000";
    String res="";
    var socket=await Socket.connect("192.168.97.146",8000);
      socket.write(requst);
      socket.flush();
      var subscription=socket.listen((response) async{
        res+=String.fromCharCodes(response);
      });
    await subscription.asFuture<void>();
    return res;
  }
}




// class booksmessage extends StatefulWidget{
//   final String name;
//   booksmessage({required this.name});
//   @override
//   State<StatefulWidget> createState() =>_booksmessagestate(name: name);
// }
// class _booksmessagestate extends State<booksmessage>{
//
//   final String name;
//   _booksmessagestate({required this.name});
//   String _fav="";
//   String _newrelease="";
//   String _topsell="";
//   List<InkWell> f=[];
//
//   @override
//   Widget build(BuildContext context) {
//     sendfav(name);
//     sendnewrelease(name);
//     sendtopsell(name);
//     return SingleChildScrollView (
//       child: Column(
//         children: [
//           const SizedBox(height: 40.0,child: Text("Favorite",style: TextStyle(fontSize: 20),),),
//           SizedBox(
//             height: 300,
//             child: ListView(
//               // This next line does the trick.
//               scrollDirection: Axis.horizontal,
//               children: convertor(_fav),
//             ),
//           ),
//           const SizedBox(height: 40.0,child: Text("new releases",style: TextStyle(fontSize: 20),),),
//           SizedBox(
//             height: 300,
//             child: ListView(
//               // This next line does the trick.
//               scrollDirection: Axis.horizontal,
//               children: convertor(_newrelease),
//             ),
//           ),
//           const SizedBox(height: 40.0,child: Text("top selling",style: TextStyle(fontSize: 20),),),
//           SizedBox(
//             height: 300,
//             child: ListView(// This next line does the trick.
//               scrollDirection: Axis.horizontal,
//               children: convertor(_topsell),
//             ),
//           )
//         ],
//       ),
//     );
//
//     throw UnimplementedError();
//   }
//
//
//
//
//
//   List<InkWell> convertor(String data){
//     List<String> books=data.split("\n");
//
//     List<InkWell> output=[];
//     if(books.isEmpty)
//       return output;
//     for(int i=0;i<books.length;i++){
//       //print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"+books.elementAt(i)+"||||||||"+books.elementAt(i).split("&&").elementAt(0)+"|||||||||||||||"+books.elementAt(i).split("&&").elementAt(1));
//       String bookname=books.elementAt(i).split("&&")[0];
//       //String image=books.elementAt(i).split("&&")[1];
//
//       output.add(InkWell(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview(username: name,bookname: bookname,)));
//         },
//         child: Text("data"),
//       )
//       );
//     }
//
//     return output;
//   }
// }
//
//
//
//
//
//




























