import 'package:flutter/material.dart';
import '../model/db_helper.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final dbHelper = DatabaseHelper.instance;
  List weightList = [];
  String currWeightUnit = " kg";
  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  void initPrefs() async {
    weightList = await dbHelper.queryAllRows();
    print(weightList);
    print(weightList.length);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "History",
          style: TextStyle(
            fontFamily: 'DMMono',
            fontWeight: FontWeight.normal,
            color: Colors.teal,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weightList.length,
          itemBuilder: (BuildContext context, indice) {
            DateTime parsedTime = DateTime.parse(weightList[indice]["time"]);
             String goal = weightList[indice]["goal"].toString();
             String weight = weightList[indice]["weight"].toString();
            final firstElement = (weightList?.length ?? 0) > 0 ? weightList.first : null;
            final lastElement = (weightList?.length ?? 0) > 0 ? weightList.last : null;
            double weightfirst = firstElement["weight"]-lastElement["weight"];
            print("Diff" + weightfirst.toString());
            print("========================");
            print(indice);
            print(weight.toString());
            print("========================");
            bool firstWeight = indice == 0;
            double difference = firstWeight?0.0:weightList[indice]["weight"] - weightList[indice-1]["weight"];
            String calender = DateFormat.d().format(parsedTime);
            print("+++++++++++++++++++++++++++");
            print(calender);
            //change/initial*100
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  height: 125.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 3),
                      spreadRadius: 2.0,
                    )],
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/calender/$calender.jpg"),
                      SizedBox(width: 20.0,),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text("Goal: " + goal,style: TextStyle(
                              fontFamily: 'DMMono',
                              fontWeight: FontWeight.normal,
                              color: Colors.teal,
                            ),),
                            SizedBox(height: 5.0,),
                            Text("Weight: " + weight,style: TextStyle(
                              fontFamily: 'DMMono',
                              fontWeight: FontWeight.normal,
                              color: Colors.teal,
                            ),),
                            Text("Date: " + DateFormat.yMMMMd().format(parsedTime),style: TextStyle(
                              fontFamily: 'DMMono',
                              fontWeight: FontWeight.normal,
                              color: Colors.teal,
                              
                            ),),
                            
                           Row(
                             children: <Widget>[
                               difference>0?
                               Icon(Icons.arrow_upward,color: Colors.teal,size: 25.0,):
                               Icon(Icons.arrow_downward,color: Colors.teal,size: 25.0),
                               difference<0?Text((difference*-1).toString(),style: TextStyle(
                                  fontFamily: 'DMMono',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.teal,
                                ),):Text(difference.toString(),style: TextStyle(
                                  fontFamily: 'DMMono',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.teal,
                                ),)
                             ],
                           )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
              ],
            );
          },
        ),
      ),
    );
  }
}