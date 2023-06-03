import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'main.dart';
import 'signup.dart';
import 'home.dart';

class Login extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "fidiboo",
            ),
          ),
        ),
        body: Container(
          //color: Colors.tealAccent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 40.0,
            ),
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
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  home()),
                              );
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


}