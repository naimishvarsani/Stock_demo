// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_demo/stocks_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<AllData>? loadAlldata;

  stockDataApi() async {
    final response = await http.get(
      Uri.parse("https://api.twelvedata.com/stocks?source=docs"),
    );
    if (response.statusCode == 200) {
      loadAlldata = StockData.fromJson(jsonDecode(response.body)).data;

      print(response.body);
      return loadAlldata;
    } else {
      print(response.statusCode);
      throw Exception('Not Found');
    }
  }

  @override
  void initState() {
    // stockDataApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Stocks Demo"),
      ),
      body: FutureBuilder(
        future: stockDataApi(),
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
                            text: 'Company Name: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                              text: loadAlldata![index].name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Country: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                              text: loadAlldata![index].country.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Currency: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                              text: loadAlldata![index].currency.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Stock Type: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                              text: loadAlldata![index].type.toString(),
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
