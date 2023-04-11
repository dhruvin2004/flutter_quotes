import 'package:flutter/material.dart';

import '../global.dart';



class HistoryPag extends StatefulWidget {
  const HistoryPag({Key? key}) : super(key: key);

  @override
  State<HistoryPag> createState() => _HistoryPagState();
}

class _HistoryPagState extends State<HistoryPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History of Quotes"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: history.length,
          itemBuilder: (context,index){return
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
              "${history[index]}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black, fontSize: 25),
            ),
          ),
        );
      }),
    );
  }
}
