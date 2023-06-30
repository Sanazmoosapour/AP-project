import 'dart:io';

import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';

class signUp extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController familynameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
        body: signupmessage(),
      ),
    );
    throw UnimplementedError();
  }
}
class signupmessage extends StatefulWidget{
  const signupmessage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>_signupmessagestate();

}
class _signupmessagestate extends State<signupmessage>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController familynameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String _log="";
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.tealAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 40.0,
        ),
        child: SingleChildScrollView(
          child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 180.0,bottom: 8.0),
                  child: Text(
                    "Sign Up",
                  style: TextStyle(
                  fontSize: 50,
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                  controller: nameController,
                      textDirection: TextDirection.ltr,
                  onChanged: (v) => nameController.text = v,
                  decoration: const InputDecoration(
                  labelText: "Name",
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: familynameController,
                    onChanged: (v) => familynameController.text = v,
                      decoration: const InputDecoration(
                        labelText: "Family Name",
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: emailController,
                    onChanged: (v) => emailController.text = v,
                    decoration: const InputDecoration(
                    labelText: "Email Address",
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: passController,
                    onChanged: (v) => passController.text = v,
                    decoration: const InputDecoration(
                      labelText: "Password",
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(onPressed: () async {
                    String response=await send(nameController.text,familynameController.text,emailController.text,passController.text);
                    switch(response){
                      case "successfull":
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        break;
                      case "this password or name have been used":
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "this password or name have been used"),
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
                        break;
                      case "you cant use your name in password":
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "you cant use your name in password"),
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
                        break;
                      case "use at least one number":
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "use at least one number"),
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
                        break;
                      case "use both uppercase letters and lowercase":
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "use both uppercase letters and lowercase"),
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
                        break;
                      case "at least 8 character require":
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "at least 8 character require"),
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
                        break;
                    }

                  },
                    child: const Text("signUp"),

                  )
                ),
              ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
  Future<String> send(String name,String familyName,String email,String pass) async{
     String res="";
    String requst="signUp\nname:$name&&familyName:$familyName&&emailAddress:$email&&password:$pass&&cash:0\n\u0000";
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


