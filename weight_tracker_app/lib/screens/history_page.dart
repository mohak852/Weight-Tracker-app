
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/db_helper.dart';
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("History",style: TextStyle(
          fontFamily: 'DMMono',
          fontWeight: FontWeight.normal,
          color: Colors.teal,
        ),),
      ),
      body: SingleChildScrollView(
        child: Expanded(
            child: SizedBox(
            height: 200.0,
          child: ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount: weightList.length>0?weightList.length: 0,
            itemBuilder: (BuildContext context, indice){
          DateTime parsedTime = DateTime.parse(weightList[indice]["date"]);
          // String goal = weightList[indice]["goal"].toString();
          // String weight = weightList[indice]["weight"].toString();
          return ListTile(
            leading: Text(weightList[indice]["goal"].toString()),
            title: Text(weightList[indice]["weight"].toString()),
          );
          },
            ),
            ),
        )
      ),
    );
  }
}
