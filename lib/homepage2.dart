// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_demo/model_2.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  List<MarketState>? loadAlldata;

  livesStockDataApi() async {
    final response = await http.get(
      Uri.parse("https://www.nseindia.com/api/marketStatus"),
    );
    if (response.statusCode == 200) {
      loadAlldata =
          LiveStockDataModel.fromJson(jsonDecode(response.body)).marketState;

      print(response.body);
      return loadAlldata;
    } else {
      print(response.statusCode);
      throw Exception('Not Found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("NSE Stocks Demo"),
      ),
      body: FutureBuilder(
        future: livesStockDataApi(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (loadAlldata!.isEmpty) {
            return Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "No Data Found",
                    style: TextStyle(color: Colors.black),
                  ),
                ));
          }
          return ListView.builder(
            itemCount: loadAlldata!.length,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                // height: 250,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Index: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                              text: loadAlldata![index].index.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Market Type: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                              text: loadAlldata![index].market.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Market: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                              text: loadAlldata![index].marketStatus.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Market Status: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                              text: loadAlldata![index]
                                  .marketStatusMessage
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
