import 'dart:io';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:pie_chart/pie_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Map<String, double> dataMap = {
  "1star": 5,
  "2star": 3,
  "3star": 2,
  "4star": 2,
};
class detailview extends StatelessWidget{
  final String username;
  final String book;
  detailview({required this.username,required this.book});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: myTheme,
      home: Scaffold(
        appBar: myAppbar(context),
        body: sendmessagedetail(username: username,book: book,),
      ),
    );
    throw UnimplementedError();
  }
}

class sendmessagedetail extends StatefulWidget{
  final String username;
  final String book;
  sendmessagedetail({required this.username,required this.book});
  @override
  State<StatefulWidget> createState() => _sendmessagedetailstate(username: username,book: book);

}

class _sendmessagedetailstate extends State<sendmessagedetail>{
  final String username;
  final String book;
  _sendmessagedetailstate({required this.username,required this.book});
  //String _log="";
  //String book="";
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.network(book.split("&&").elementAt(13).split("::").elementAt(1)),
                  ),
                  Column(
                    children: [
                       Center(
                        child: Text(book.split("&&").elementAt(0).split(":").elementAt(1),style: TextStyle(fontSize: 20),),
                      ),
                       Center(
                        child: Text(book.split("&&").elementAt(2).split(":").elementAt(1)),
                      ),
                       Text(book.split("&&").elementAt(3).split(":").elementAt(1)+"نسخه الكترونيكي :  ",textAlign: TextAlign.center,),
                       Text(book.split("&&").elementAt(6).split(":").elementAt(1)+"pages" ,textAlign: TextAlign.center,),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: (){
                                  sendread(username,book.split("&&").elementAt(0).split(":").elementAt(0));
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview(username: username,book: book,)));
                                },
                                child: Text("i have read ")
                            ),
                            //book.split("&&").elementAt(4).split(":").elementAt(1)=="yes"
                            IconButton(
                              onPressed: (){
                                sendlike(username, book.split("&&").elementAt(0).split(":").elementAt(0));
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview(username: username,book: book,)));
                              },
                              icon: FaIcon(FontAwesomeIcons.heart),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ]
            ),
            //Text("کتاب اسب من اثر معین دهاز مجموعه شعری است که در سال 1396 و توسط نشر چشمه منتشرشده است. اسب من مجموعه‌ای از اشعار سپید است. کتاب با خلاصه‌ای دوخطی شروع می‌شود که در آن شاعر تذکر داده است که نام‌گذاری اشعار در کتاب تنها باهدف فهرست‌نویسی برای کتاب صورت گرفته است و درواقع هیچ‌کدام از شعرهایش عنوان ندارند. پس‌ازآن به‌جای مقدمه دوباره قطعه‌ی ادبی کوتاهی نوشته‌شده است که خود می‌توانست باکمی رنگ‌آمیزی تبدیل به شعر دیگری از مجموعه اشعار این کتاب شود: «...شیش،هفت،هشت،نه...ده. بیام؟ پشت سرم وانسیدا، حساب نیست. بیام؟! اومدم...» برمی‌گردد. همه‌ی دنیا صحراست. برمی‌گردد، دیوار هم نیست، فقط صحراست.",textAlign: TextAlign.center,),

            SizedBox(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ // Padding(padding: EdgeInsets.only(left: 20.0)),
                      ElevatedButton(
                          style: ButtonStyle(
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>payment(money: book.split("&&").elementAt(1).split(":").elementAt(1) as double,username: username,bookname: book.split("&&").elementAt(0).split(":").elementAt(0))));
                          },
                          child: Text(book.split("&&").elementAt(1).split(":").elementAt(1)+"buy")
                      ),
                      ElevatedButton(
                          onPressed: (){// Navigator.push(context, MaterialPageRoute(builder: (context)=>shop()));
                          },
                          child: Text("Download")
                      ),
                      ElevatedButton(
                          onPressed: (){// Navigator.push(context, MaterialPageRoute(builder: (context)=>shop()));
                          },
                          child: Text("in app view")
                      ),
                    ],
                  ),
                )
            ),
            Center(
                child: Padding(padding: EdgeInsets.all(50.0),
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) async {
                      String response=await sendrate(username,book.split("&&").elementAt(0).split(":")[1],rating);
                      if(response=="succesfull"){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview(username: username, book: book)));
                      }
                      else{
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "you cant rate a book that you havent buy yet"),
                                actions: [
                                  ElevatedButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    },
                  ),)
            ),
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("rating: "+book.split("&&").elementAt(12).split(":").elementAt(1)),
            )
          ]
      ),
    );
    throw UnimplementedError();
  }


  Future<String> sendlike(String username,String bookname) async{
    String requst="like\nname:$username&&bookname:$bookname\u0000";
    var socket= await Socket.connect("192.168.97.146",8000);
    String res="";
    socket.write(requst);
    socket.flush();
    var subscription=socket.listen((response) {
      res+=String.fromCharCodes(response);
    });
    await subscription.asFuture<void>();
    return res;
  }
  Future<String> sendread(String username,String bookname) async{
    String requst="read\nname:$username&&bookname:$bookname\u0000";
    var socket= await Socket.connect("192.168.97.146",8000);
    String res="";
      socket.write(requst);
      socket.flush();
      var subscription=socket.listen((response) {
        res+=String.fromCharCodes(response);
      });
    await subscription.asFuture<void>();
    return res;
  }

  Future<String> sendrate(String username,String bookname,double rate) async{
    String requst="rate\nname:$username&&bookname:$bookname&&rate:$rate\u0000";
    print(requst);
    var socket= await Socket.connect("192.168.97.146",8000);
    String res="";
    socket.write(requst);
    socket.flush();
    var subscription=socket.listen((response) {
      res+=String.fromCharCodes(response);
    });
    await subscription.asFuture<void>();
    return res;
  }
  Future<String> sendratewant(String username,String bookname) async{
    String requst="ratewant\nname:$username&&bookname:$bookname\u0000";
    var socket= await Socket.connect("192.168.97.146",8000);
    String res="";
    socket.write(requst);
    socket.flush();
    var subscription=socket.listen((response) {
      res+=String.fromCharCodes(response);
    });
    await subscription.asFuture<void>();
    return res;
  }

}




