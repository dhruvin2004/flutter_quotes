import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_exam/screen/historypage.dart';

import '../global.dart';

class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  var intValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        intValue++;
        history.add(list[intValue]['Quote']);
        if(intValue > 28){
          intValue = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        child: SafeArea(top: true, child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HistoryPag()));
                });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 50,
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text("History of Quotes"),
              ),
            ),
          ],
        )),
      ),
      appBar: AppBar(
        title: Text("Quotes App"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            width: w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HSLColor.fromAHSL(1.0,
                      Random().nextDouble() * 360, 0.5, 0.8)
                      .toColor(),
                  HSLColor.fromAHSL(1.0,
                      Random().nextDouble() * 360, 0.5, 0.8)
                      .toColor()
                ],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(list[intValue]['Quote'],
                style: const TextStyle(color: Colors.black, fontSize: 25)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "All Quotes",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 220,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list[index]['Quote'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
