import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
    CarouselController controller = CarouselController();
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
               icon: const Icon(Icons.menu),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccount()));
                  }else if(value == 1){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> settings()));
                  }else if(value == 2){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login()));
                  }
                }
            ),
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  home()));
                },
                icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  shop()));
              },
              icon: Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  lib()));
              },
              icon: Icon(Icons.library_books_outlined),
            )

          ],
          title: const Center(
            child: Text(
              "fidiboo",
            ),

          ),
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 200.0,width: 2000.0,child: CarouselSlider(
                carouselController: controller ,

                options: CarouselOptions(height: 400.0,autoPlay: true,aspectRatio: 2.0,
                  enlargeCenterPage: true,),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      if(i==1) {
                        return const Image(image: AssetImage('images/book1.jpg'));
                      }
                      if(i==2) {
                        return const Image(image: AssetImage('images/book2.jpg'));
                      }
                      if(i==3) {
                        return const Image(image: AssetImage('images/book3.jpeg'));
                      }
                      if(i==4) {
                        return const Image(image: AssetImage('images/book4.jpg'));
                      }
                      if(i==5) {
                        return const Image(image: AssetImage('images/book5.jpg'));
                      }
                      return const Image(image: AssetImage('images/book.png'));
                    },
                  );
                }).toList(),
              ),),
              SizedBox( height: 500,
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.teal,
                      bottom:  const TabBar(
                        tabs: [
                          Tab(icon: Text("Ebooks")),
                          Tab(icon: Text("Audiobooks")),
                          Tab(icon: Text("Mylibrary")),
                        ],
                      ),
                    ),
                    body:  TabBarView(
                      children: [
                        Ebook(),
                        Icon(Icons.directions_transit),
                        Icon(Icons.directions_bike),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),),



      backgroundColor: Colors.tealAccent,
    )

    ); throw UnimplementedError();
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

class settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: myAppbar(),
        body: const Center(
          child: Text("settings"),
      ),
      ),
    );
    throw UnimplementedError();
  }

}

class Ebook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  child: Image.network('https://newcdn.fidibo.com/images/books/85437_48595_normal.jpg?width=200'),
                ),



              ),
              Container(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                  },
                  child: Image.network('https://newcdn.fidibo.com/images/books/118215_13484_normal.jpg?width=200'),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                  },
                  child: Image.network('https://newcdn.fidibo.com/images/books/90294_51440_normal.jpg?width=200'),
                ),
              ),
              Container(
                child:InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                  },
                  child: Image.network('https://newcdn.fidibo.com/images/books/99473_44720_normal.jpg?width=200'),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                  },
                  child: Image.network('https://newcdn.fidibo.com/images/books/100102_63516_normal.jpg?width=200'),
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
                        child: Image.network('https://newcdn.fidibo.com/images/books/69380_61867_normal.jpg?width=200'),
                      ),


                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/69569_47206_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/118203_76231_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/109673_93017_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/98322_90207_normal.jpg?width=200'),
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
                        child: Image.network('https://newcdn.fidibo.com/images/books/69459_83225_normal.jpg?width=200'),
                      ),

                    ),
                    Container(
                      child:  InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/70526_64499_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/1998_41564_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/62989_77673_normal.jpg?width=200'),
                      ),
                    ),
                    Container(
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                        },
                        child: Image.network('https://newcdn.fidibo.com/images/books/113320_76086_normal.jpg?width=200'),
                      ),
                    ),
                  ],
                ),
              )
            ],
      ),
        ),
            backgroundColor: Colors.tealAccent,
      )
    );
    throw UnimplementedError();
  }

}

class lib extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: myAppbar(),
        body: const Center(
          child: Text("lib"),
        ),
      ),
    );
    throw UnimplementedError();
  }

}
class detailview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: myAppbar(),
        body: const Center(
          child: Text("mybook"),
        ),
        backgroundColor: Colors.tealAccent,
      ),
    );
    throw UnimplementedError();
  }

}

class MyAccount extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: myAppbar(),
      body: const Center(
        child: Text("Account"),
      ),
    ),
  );
  throw UnimplementedError();
}

}

class shop extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: myAppbar(),
        body: const Center(
          child: Text("Wallet"),
        ),
      ),
    );
    throw UnimplementedError();
  }

}

AppBar myAppbar(){
  return AppBar(
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

  );

}

