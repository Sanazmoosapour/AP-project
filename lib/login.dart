import 'dart:io';

import 'package:flutter/material.dart';
import 'main.dart';
import 'signup.dart';
import 'home.dart';

class Login extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: myTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                "fidiboo",
              ),
            ),
          ),
          body: Loginmessage(),
        )
    );
    throw UnimplementedError();
  }
}

class Loginmessage extends StatefulWidget{
  const Loginmessage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>_Loginmessagestate();

}
class _Loginmessagestate extends State<Loginmessage>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String _log="";
  String _favaudio="";
  String _topsellaudio="";
  String _newreleaseaudio="";
  String _fav="";
  String _topsell="";
  String _newrelease="";

  @override
  Widget build(BuildContext context) {
    return Container(
//color: Colors.tealAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 40.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(bottom: 8.0,top: 180.0),
                  child: Text("Log In",style: TextStyle(fontSize: 40),)
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: nameController,
                    onChanged: (v) => nameController.text = v,
                    decoration: const InputDecoration(
                      labelText: 'name',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: passController,
                    onChanged: (v) => passController.text = v,
                    decoration: const InputDecoration(
                      labelText: "pass",
                    )),
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 8.0,right: 40.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            String response=await send(nameController.text,passController.text);
                            //print(String.fromCharCodes(response).split("&&").elementAt(0));
                            print(response+"|||||||||||||||||||||||||||||||||||||||||");
                            if(response.split("&&").elementAt(0)=="succesfull"){
                              String name=nameController.text;
                              print(name);
                              String faveaudio=await sendfavaudio(name);
                              print("faveaudio: "+faveaudio);
                              String newreleaseaudio=await sendnewreleaseaudio(name);
                              print("newreleaseaudio: "+newreleaseaudio);
                              String topsellaudio=await sendtopsellaudio(name);
                              print("topselaudio: "+topsellaudio);
                              String favebook=await sendfav(name);
                              print("favebook: "+favebook);
                              String topsellebook=await sendtopsell(name);
                              print("topselebook: "+topsellebook);
                              String newreleaseebook=await sendnewrelease(name);
                              print("topsellebook: "+newreleaseebook);
                              //print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22"+fave);
                              //print();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> home(name: name,favaudio: faveaudio ,favebook: favebook,topselaudio: topsellaudio,topselebook: topsellebook,newaudio: newreleaseaudio,newebook: newreleaseebook,)));
                            }
                            else{
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text(
                                          _log),
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
                          child: Text("log in")
                      )

                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 8.0,right: 10.0),
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  signUp()),
                            );
                          },
                          child: Text("sign up")
                      )

                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  static Future<String> send(String name,String pass) async{
    String requst="logIn\nname:$name&&password:$pass\u0000";
    print(requst);
    String res="";
    var socket=await Socket.connect("192.168.97.146",8000) ;
      socket.write(requst);
      socket.flush();
      var subscription=socket.listen((response) async {
        res+=String.fromCharCodes(response)+"\n";
      });
      await subscription.asFuture<void>();

    return res;
  }

   static Future<String> sendfavaudio(String name) async{
    String sortby="favaudiobook";
    String requst="sortBooks\nname:$name&&sortby:$sortby\u0000";
    print(requst);
    String res="";
    var socket=await Socket.connect("192.168.97.146",8000);
      socket.write(requst);
      socket.flush();
      var subscription=socket.listen((response) async {
        res+=String.fromCharCodes(response)+"\n";

      });
    await subscription.asFuture<void>();
    return res;
  }

  static Future<String> sendtopsellaudio(String name) async{
    String requst="sortBooks\nname:$name&&sortby:topsellingaudiobook\u0000";
    String res="";
    var socket=await Socket.connect("192.168.97.146",8000) ;
      socket.write(requst);
      socket.flush();
      var subscription=socket.listen((response) async{
        res+=String.fromCharCodes(response);

      });
    await subscription.asFuture<void>();
    //print(res+"||||||||||||||||||||||||||||||||||||");
    return res;
  }
  Future<String> sendnewreleaseaudio(String name) async{
    String requst="sortBooks\nname:$name&&sortby:newreleaseaudiobook\u0000";
    String res="";
    var socket=await Socket.connect("192.168.97.146",8000) ;
    socket.write(requst);
    socket.flush();
    var subscription=socket.listen((response) async{
      res+=String.fromCharCodes(response);

    });
    await subscription.asFuture<void>();
    //print(res+"||||||||||||||||||||||||||||||||||||");
    return res;

  }


  Future<String> sendfav(String name) async{
    String requst="sortBooks\nname:$name&&sortby:favebook\u0000";
    String res="";
    var socket=await Socket.connect("192.168.97.146",8000) ;
    socket.write(requst);
    socket.flush();
    var subscription=socket.listen((response) async{
      res+=String.fromCharCodes(response);

    });
    await subscription.asFuture<void>();
    //print(res+"||||||||||||||||||||||||||||||||||||");
    return res;
  }
  Future<String> sendtopsell(String name) async{
    String requst="sortBooks\nname:$name&&sortby:topsellingebook\u0000";
    String res="";
    var socket=await Socket.connect("192.168.97.146",8000) ;
    socket.write(requst);
    socket.flush();
    var subscription=socket.listen((response) async{
      res+=String.fromCharCodes(response);

    });
    await subscription.asFuture<void>();
    //print(res+"||||||||||||||||||||||||||||||||||||");
    return res;

  }
  Future<String> sendnewrelease(String name) async{
    String requst="sortBooks\nname:$name&&sortby:newreleaseebook\u0000";
    String res="";
    var socket=await Socket.connect("192.168.97.146",8000) ;
    socket.write(requst);
    socket.flush();
    var subscription=socket.listen((response) async{
      res+=String.fromCharCodes(response);

    });
    await subscription.asFuture<void>();
    //print(res+"||||||||||||||||||||||||||||||||||||");
    return res;
  }

}



