import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() async {
  Map data = await getAllData();

  var f = (data["main"]["temp"].toString());
  print(f);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
        drawer: Drawer(
          elevation: 15,
        ),
        appBar: new AppBar(
          title: Text("Weather App"),
          backgroundColor: Colors.purple[300],
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search), onPressed: () => debugPrint("Search"),
                
                )
          ],
        ),
        body: Center(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/nature.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
           
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:80.0),
                child: Text(
                        data["name"],
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Aveny"),
                      ),
              ),

              Text(
                      data["weather"][0]["main"],
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Aveny"),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 60.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      data["main"]["temp"].toString(),
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Aveny"),
                    ),
                    Text(
                      "Celsius",
                      style: TextStyle(
                          fontSize: 25,
                          color:Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Aveny"),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:16.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Feels Like",
                          style: TextStyle(
                              fontSize: 30, color: Colors.black87, fontFamily: "Aveny"),
                        ),
                        Text(
                          data["main"]["feels_like"].toString(),
                          style: TextStyle(
                              color: Colors.black87, fontSize: 50, fontFamily: "Aveny"),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:80.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Humidity",
                          style: TextStyle(
                              fontSize: 30, color: Colors.black87, fontFamily: "Aveny"),
                        ),
                        Text(
                          data["main"]["humidity"].toString(),
                          style: TextStyle(
                              color: Colors.black87, fontSize: 50, fontFamily: "Aveny"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ))),
  )
  );
}

Future<Map> getAllData() async {
  var api =
      'http://api.openweathermap.org/data/2.5/weather?q=Karachi,pk&units=metric&APPID=a1b9471c6afaa0bfa67f1fb1a46aff7c';

  var response = await http.get(api);

  var jsonData = json.decode(response.body);

  return jsonData;
}
