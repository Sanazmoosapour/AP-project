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
                    padding: EdgeInsets.only(bottom: 8.0),
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
                   Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                   child: ElevatedButton(
                       onPressed: (){
                         Navigator.push(
                             context,
                         MaterialPageRoute(builder: (context) =>  SecondRoute()),
                         );
                       },
                       child: Text("log in")
                   )

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
  class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("second screen"),),
        body: Center(
          child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("back")
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

    
  }





