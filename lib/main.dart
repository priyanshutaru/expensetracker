// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:expensetracker/widgets/traction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transaction = [
    Transaction(
      id: "1",
      name: "Shoes",
      prise: 400,
      time: DateTime.now(),
    ),
    Transaction(
      id: "2",
      name: "Mobile Cover",
      prise: 200,
      time: DateTime.now(),
    ),
  ];
  late String userText;
  late String userAmount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Title"),
                      ),
                      onChanged: (value) {
                        userText = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Amount"),
                      ),
                      onChanged: (value) {
                        userAmount = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(userText);
                        print(userAmount);
                      },
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: transaction.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                    ),
                    child: Text(
                      '\$  ' + tx.prise.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat(' MMM d, yyyy').format(tx.time),
                        // tx.time.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
