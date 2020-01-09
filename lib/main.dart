import 'dart:convert';

import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home : Home()
));


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading json"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
            .of(context)
            .loadString("load_json/person.json"),
            builder: (context,snapshot){
                var myData = json.decode(snapshot.data.toString());
                if(myData == null){
                  return Text("Loading....");
                }
                else{
                  return ListView.builder(
                      itemCount:myData.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          child: Column(
                            children: <Widget>[
                              Text("Name : " +myData["posts"][0]["comment"][0]["reply"][0]["image"])
                            ],
                          ),

                        );
                      });
                }



            },
          ),
        ),
      ),
    );
  }
}
