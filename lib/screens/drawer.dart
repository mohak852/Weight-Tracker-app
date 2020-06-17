import 'package:flutter/material.dart';


class DrawerApp extends StatefulWidget {
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              color: Colors.black,
              child: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text("Settings",style: TextStyle(
              color: Colors.blue
            ),),
          ),
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text("Settings",style: TextStyle(
              color: Colors.blue
            ),),
          ),
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text("Settings",style: TextStyle(
              color: Colors.blue
            ),),
          ),
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text("Settings",style: TextStyle(
              color: Colors.blue
            ),),
          ),
        ],
      ),
    );
  }
}
