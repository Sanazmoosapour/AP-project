


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login.dart';
import 'home.dart';
import 'change.dart';
import 'detailview.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:filter_list/filter_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


ThemeData lightTheme=ThemeData(
  colorScheme: ColorScheme(brightness: Brightness.light,
      primary: Colors.deepOrange.shade900,
      onPrimary: Colors.white,
      secondary: Colors.deepPurple,
      onSecondary: Colors.purpleAccent,
      error: Colors.red,
      onError: Colors.tealAccent,
      background: Colors.black87,
      onBackground: Colors.indigo,
      surface: Colors.purpleAccent,
      onSurface: Colors.lightBlueAccent),
  scaffoldBackgroundColor: Colors.deepOrange[50],
  primaryColor: Colors.deepOrange[100],
  //iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(myTheme.scaffoldBackgroundColor))),

);

ThemeData darkTheme=ThemeData(
  colorScheme: ColorScheme(brightness: Brightness.dark,
      primary: Colors.black87,
      onPrimary: Colors.white,
      secondary: Colors.deepOrange,
      onSecondary: Colors.black87,
      error: Colors.red,
      onError: Colors.tealAccent,
      background: Colors.black87,
      onBackground: Colors.indigo,
      surface: Colors.black87,
      onSurface: Colors.white),
  scaffoldBackgroundColor: Colors.black38,
  primaryColor: Colors.black38,
  //iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(myTheme.scaffoldBackgroundColor))),
);

ThemeData myTheme=lightTheme;

void main() {
  runApp( MaterialApp(
    title: 'Navigation Basics',
    home: Login(),
  ));
}



class lib extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: myTheme,
      home: Scaffold(
          appBar: myAppbar(context),
          body:  Column(
            children: [
              PopupMenuButton(
                  padding: EdgeInsets.only(left: 10.0),
                  // add icon, by default "3 dot" icon
                  icon: const Icon(Icons.sort),
                  itemBuilder: (context){
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("date"),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text("audio books"),
                      ),

                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text("ebook"),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text("popular"),
                      ),
                    ];
                  },
                  onSelected:(value){
                    if(value == 0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> lib()));
                    }else if(value == 1){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  lib()));
                    }
                    else if(value == 2){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  lib()));
                    }
                    else if(value == 3){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  lib()));
                    }
                  }
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Container(
                            child:InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                              },
                              child: Image.network('https://newcdn.fidibo.com/images/books/1998_41564_normal.jpg?width=200',width: MediaQuery.of(context).size.width/3,),
                            ),
                          ),
                          Container(
                            child:InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                              },
                              child: Image.network('https://newcdn.fidibo.com/images/books/62989_77673_normal.jpg?width=200',width: MediaQuery.of(context).size.width/3),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // width: 160.0,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                              },
                              child: Image.network('https://newcdn.fidibo.com/images/books/69459_83225_normal.jpg?width=200',width: MediaQuery.of(context).size.width/3),
                            ),

                          ),
                          Container(
                            child:  InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                              },
                              child: Image.network('https://newcdn.fidibo.com/images/books/70526_64499_normal.jpg?width=200',width: MediaQuery.of(context).size.width/3),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )

      ),
    );
    throw UnimplementedError();
  }

}

class MyAccount extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return  MaterialApp(
    theme: myTheme,
    home: Scaffold(
      appBar: myAppbar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  color: myTheme.primaryColor,
                  child: Padding(padding: EdgeInsets.all(50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          child: Image.network("https://www.hongrayphoto.com/wp-content/uploads/2021/03/Singapore-Passport-Studio-Photo-9.jpg"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("name : sanaz"),

                            Text("family name: moosapour"),

                            Text("email : sa.82mo@yahoo.com"),

                            TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>change()));
                                },
                                child: Text("tap to change information")
                            ),
                            Text("اعتبار فعلي: 80,000"),
                          ],
                        )
                      ],
                    ),)
              ),

              Padding(
                padding: EdgeInsets.all(50.0),
                child: Container(
                  //color: Colors.pink[200],
                  child:  Row(
                    children: [
                      Text("select theme"),
                      IconButton(
                          onPressed: (){
                            myTheme=darkTheme;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAccount()));
                          },
                          icon: Icon(Icons.nightlight_round_sharp)
                      ),
                      IconButton(
                          onPressed: (){
                            myTheme=lightTheme;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAccount()));
                          },
                          icon: Icon(Icons.sunny)
                      )
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.pink[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Text("ارتقا به اكانت ويژه \n يك ماهه \n مبلغ: 10.000",textAlign: TextAlign.center,),
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> payment(money: 10000)));},
                      splashColor: myTheme.primaryColor,
                      focusColor: myTheme.primaryColor,
                      hoverColor:myTheme.primaryColor ,
                      highlightColor: myTheme.primaryColor,
                    ),
                    InkWell(
                      child: Text("ارتقا به اكانت ويژه \n دو ماهه \n مبلغ: 20.000",textAlign: TextAlign.center,),
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> payment(money: 20000)));},
                      splashColor: myTheme.primaryColor,
                      focusColor: myTheme.primaryColor,
                      hoverColor:myTheme.primaryColor ,
                      highlightColor: myTheme.primaryColor,
                    ),
                    Container(
                      //color: Colors.pink[300],
                      child: InkWell(
                        child: Text("ارتقا به اكانت ويژه \n سه ماهه \n مبلغ: 30.000",textAlign: TextAlign.center,),
                        onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> payment(money: 30000)));},
                        splashColor: myTheme.primaryColor,
                        focusColor: myTheme.primaryColor,
                        hoverColor:myTheme.primaryColor ,
                        highlightColor: myTheme.primaryColor,
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> payment(money: 10000)));
                    },
                    child: Text("افزايش اعتبار,10,000")
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> payment(money: 20000)));
                    },
                    child: Text("افزايش اعتبار,20,000")
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> payment(money: 40000)));
                    },
                    child: Text("افزايش اعتبار,40,000")
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> payment(money: 70000)));
                    },
                    child: Text("افزايش اعتبار,70,000")
                ),
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

class shop extends StatelessWidget{
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String>? selectedUserList;
    // const FilterPage({Key? key, this.selectedUserList})
    //     : super(key: key);
    return  MaterialApp(
      theme: myTheme,
      home: Scaffold(
        appBar: myAppbar(context),
        body: Column(
          children: [
            Row(
              children: [
                AnimSearchBar(
                  width: 400,
                  textController: textController, onSuffixTap: null, onSubmitted: (String ) {  },
                ),
                PopupMenuButton(
                    padding: EdgeInsets.only(left: 10.0),
                    // add icon, by default "3 dot" icon
                    icon: const Icon(Icons.sort),
                    itemBuilder: (context){
                      return [
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text("most liked"),
                        ),
                        const PopupMenuItem<int>(
                          value: 1,
                          child: Text("most expensive"),
                        ),

                        const PopupMenuItem<int>(
                          value: 2,
                          child: Text("cheapest"),
                        ),
                      ];
                    },
                    onSelected:(value){
                      if(value == 0){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> shop()));
                      }else if(value == 1){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  shop()));
                      }
                      else if(value == 2){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  shop()));
                      }
                    }
                ),
                IconButton(onPressed: (){
                  FilterListWidget<String>(
                    listData: ["horror","fantasy","romance","drama"],
                    //selectedListData: selectedUserList,
                    onApplyButtonClick: (list) {

                    },
                    choiceChipLabel: (item) {
                      /// Used to display text on chip
                      //return item!.name;
                    },
                    validateSelectedItem: (list, val) {
                      ///  identify if item is selected or not
                      return list!.contains(val);
                    },
                    onItemSearch: (user, query) {
                      /// When search query change in search bar then this method will be called
                      ///
                      /// Check if items contains query
                      return user.isEmpty;
                    },
                  );
                }, icon: Icon(Icons.filter_alt_sharp))

              ],
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Container(
                          child:InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                            },
                            child: Image.network('https://newcdn.fidibo.com/images/books/1998_41564_normal.jpg?width=200',width: MediaQuery.of(context).size.width/3,),
                          ),
                        ),
                        Container(
                          child:InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                            },
                            child: Image.network('https://newcdn.fidibo.com/images/books/62989_77673_normal.jpg?width=200',width: MediaQuery.of(context).size.width/3),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          // width: 160.0,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                            },
                            child: Image.network('https://newcdn.fidibo.com/images/books/69459_83225_normal.jpg?width=200',width: MediaQuery.of(context).size.width/3),
                          ),

                        ),
                        Container(
                          child:  InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>detailview()));
                            },
                            child: Image.network('https://newcdn.fidibo.com/images/books/70526_64499_normal.jpg?width=200',width: MediaQuery.of(context).size.width/3),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

}

AppBar myAppbar(BuildContext context){

  return AppBar(

    // backgroundColor:Colors.teal,
    // titleTextStyle: const TextStyle(
    //   color: Colors.black,
    //   fontSize: 50,
    //   fontStyle: FontStyle.normal,
    // ),
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
                value: 2,
                child: Text("Logout"),
              ),
            ];
          },
          onSelected:(value){
            if(value == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccount()));
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
      ),


    ],
    title: const Center(
      child: Text(
        "fidiboo",
      ),

    ),
  );

}

class payment extends StatelessWidget{
  TextEditingController pass=TextEditingController();
  final double money;
  payment({required this.money});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: Scaffold(
        appBar: myAppbar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("if you confirm enter your credit card password: "),
            Text("price: "+money.toString()),
            TextField(
                controller: pass,
                onChanged: (v) => pass.text = v,
                decoration: const InputDecoration(
                  labelText: "credit card password",
                )),
            ElevatedButton(onPressed: (){}, child: Text("pay"))

          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

}