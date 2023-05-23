import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    title: 'Navigation Basics',
    home: Login(),
  ));
}
class Login extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "materialapp",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.teal,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontStyle: FontStyle.normal,
          ),
          title: const Center(
            child: Text(
              "fidiboo",
            ),
          ),

        ),
        body: Container(
          color: Colors.tealAccent,
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
      ),
    );
    throw UnimplementedError();
  }


}
class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.teal,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontStyle: FontStyle.normal,
          ),
          actions: [
            PopupMenuButton(
              // add icon, by default "3 dot" icon
                icon: const Icon(Icons.account_circle),
                itemBuilder: (context){
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("My Account"),
                    ),

                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Settings"),
                    ),

                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Logout"),
                    ),
                  ];
                },
                onSelected:(value){
                  if(value == 0){
                    print("My account menu is selected.");
                  }else if(value == 1){
                    print("Settings menu is selected.");
                  }else if(value == 2){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login()));
                  }
                }
            ),
            ElevatedButton(
                onPressed: (){
                },
                child: Container(
                  color: Colors.teal,
                  child: Icon(Icons.add_card),
                )
            )


          ],
          title: const Center(
            child: Text(
              "fidiboo",
            ),

          ),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) =>  home()));
              },
              child: Text("back")
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }


}
class signUp extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController familynameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.teal,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontStyle: FontStyle.normal,
          ),
          title: const Center(
            child: Text(
              "fidiboo",
            ),
          ),
        ),
        body: Container(
          color: Colors.tealAccent,
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
      ),
    );
    throw UnimplementedError();
  }


}


