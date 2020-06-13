import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weighttrackerapp/Services/authSerive.dart';
import 'package:weighttrackerapp/model/db_helper.dart';
import 'button_page.dart';
import 'package:fl_chart/fl_chart.dart';
class MainPage extends StatefulWidget {
  final String text;
  MainPage({Key key, @required this.text}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List weightList= [];
  List data = [];
  @override
  void initState() {
    initPrefs();
    getIntValuesSF();
    getGoalValuesSF();
    getData();
    super.initState();
  }
  void updateGoal(){
    setState(() {
      getGoalValuesSF();
      getIntValuesSF();
      print(intValue);
      print(goalValue);
    });
  }
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  void initPrefs() async {
    weightList = await databaseHelper.queryAllRows();
    print(weightList);
    print(weightList.length);
    setState(() {});
  }
  void getData(){
    for(int i=0;i<weightList.length;i++){
      data = weightList[i]["weight"];
      setState(() {
        data = weightList[i]["weight"];
      });
    }
    
    print("+++++++++++++++++++++++++++");
    print(data);
  }
  int intValue = 0;
  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    setState(() {
      intValue = prefs.getInt('intWeightValue');
    });
  }


  int goalValue = 0;
  getGoalValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    setState(() {
      goalValue = prefs.getInt('intGoalValue');
      print("Goal Value is "+goalValue.toString());

    });
  }
  

  
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottomOpacity: 10.0,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Container(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text("${widget.text}",style: TextStyle(
              fontFamily: 'DMMono',
              fontWeight: FontWeight.normal,
              color: Colors.teal,
          ),),
            ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 400.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                    color: Colors.grey,
                  )],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        gradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.black87,
                        ]),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0))
                      ),
                      child:Center(
                        child: Text("Weight Loss Progress",style: TextStyle(
                          fontFamily: 'DMMono',
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.teal,
                        ),),
                      ),
                    ),
                    Center(
                    child: Container(
                padding: EdgeInsets.all(20.0),
                height: 350.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.teal,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                    color: Colors.grey,
                  ),],
                ),
                    ),
                    ),
                  ]
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [BoxShadow(
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                        offset: Offset(0, 5),
                        color: Colors.grey.shade700,
                      )],
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Text(intValue.toString()!=null?intValue.toString():0.toString(),style: TextStyle(
                            fontFamily: 'DMMono',
                            fontSize: 22.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.teal,
                          ),),
                          SizedBox(height: 10.0,),
                          Center(
                            child: Text("Current \n Weight",style:TextStyle(
                              fontFamily: 'DMMono',
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.teal,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: Colors.teal,
                      ),),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [BoxShadow(
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                        offset: Offset(0, 1),
                        color: Colors.grey.shade700,
                      )],
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0,),
                          Text(goalValue.toString()==null?0.toString():goalValue.toString(),style: TextStyle(
                            fontFamily: 'DMMono',
                            fontSize: 25.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.teal,
                          ),),
                          SizedBox(height: 10.0,),
                          Center(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 25.0),
                                Text("Goal ",style:TextStyle(
                                  fontFamily: 'DMMono',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.teal,
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20.0,),
              Container(
                height: 60.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                    color: Colors.grey,
                  )],
                ),
                child: ListTile(
                  leading: Icon(Icons.history,color: Colors.teal,),
                  title: Text("History",style:TextStyle(
                    fontFamily: 'DMMono',
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.teal,
                  ),),
                  trailing: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/HistoryPage');
                    },
                      child: Icon(Icons.arrow_forward,color: Colors.teal)),
                ),
              ),
              SizedBox(height: 30.0,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(
                builder: (context) => ButtonPage()
            ));
          },
        backgroundColor: Colors.black,
        child: Icon(Icons.add,color: Colors.teal),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
