import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'main.dart';
import 'login.dart';

class signUp extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController familynameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
          // color: Colors.tealAccent,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 40.0,
              ),
              child:Column(
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
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Login()),
                            );
                          },
                          child: const Text("sign up")
                      )
                  ),
                ],
              )
          ),
        ),
      );
    throw UnimplementedError();
  }


}