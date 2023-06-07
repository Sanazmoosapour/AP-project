import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:pie_chart/pie_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class detailview extends StatelessWidget{
  Map<String, double> dataMap = {
    "1star": 5,
    "2star": 3,
    "3star": 2,
    "4star": 2,
  };
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: myTheme,
      home: Scaffold(
        appBar: myAppbar(context),
        body: SingleChildScrollView(
          child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Image.network('https://newcdn.fidibo.com/images/books/85437_48595_normal.jpg?width=200'),
                      ),
                      Column(
                        children: [
                          const Center(
                            child: Text("کتاب اسب من",style: TextStyle(fontSize: 20),),
                          ),
                          const Center(
                            child: Text("نویسنده : معین دهاز"),
                          ),
                          const Text("نسخه الكترونيكي : دارد ",textAlign: TextAlign.center,),
                          const Text("106 صفحه ",textAlign: TextAlign.center,),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: (){

                                    },
                                    child: Text("i have red ")
                                ),
                                IconButton(
                                    onPressed: (){

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
                Text("کتاب اسب من اثر معین دهاز مجموعه شعری است که در سال 1396 و توسط نشر چشمه منتشرشده است. اسب من مجموعه‌ای از اشعار سپید است. کتاب با خلاصه‌ای دوخطی شروع می‌شود که در آن شاعر تذکر داده است که نام‌گذاری اشعار در کتاب تنها باهدف فهرست‌نویسی برای کتاب صورت گرفته است و درواقع هیچ‌کدام از شعرهایش عنوان ندارند. پس‌ازآن به‌جای مقدمه دوباره قطعه‌ی ادبی کوتاهی نوشته‌شده است که خود می‌توانست باکمی رنگ‌آمیزی تبدیل به شعر دیگری از مجموعه اشعار این کتاب شود: «...شیش،هفت،هشت،نه...ده. بیام؟ پشت سرم وانسیدا، حساب نیست. بیام؟! اومدم...» برمی‌گردد. همه‌ی دنیا صحراست. برمی‌گردد، دیوار هم نیست، فقط صحراست.",textAlign: TextAlign.center,),

                SizedBox(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Padding(padding: EdgeInsets.only(left: 20.0)),
                          ElevatedButton(
                              style: ButtonStyle(
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>payment(money: 80000)));
                              },
                              child: Text("buy\n80,000")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>shop()));
                              },
                              child: Text("Download")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>shop()));
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
                        onRatingUpdate: (rating) {
                        },
                      ),)
                ),
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: PieChart(
                    dataMap: dataMap ,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    //colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 32,
                    centerText: "vote",
                    legendOptions: const LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      showLegends: true,
                      //legendShape: _BoxShape.circle,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}