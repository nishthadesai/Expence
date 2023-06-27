# expence

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


main.dart:
import 'package:expence/moduls/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Flutter Demo',
theme: ThemeData(
primarySwatch: Colors.red,
),
home: MyHomePage(),
);
}
}

class MyHomePage extends StatefulWidget {
MyHomePage({Key? key}) : super(key: key);
//  final _formkey = GlobalKey<FormState>();
@override
State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final titleController = TextEditingController();
final amountController = TextEditingController();
final descriptionController = TextEditingController();

List<Transaction> transaction = [
Transaction(
id: 't1', title: 'Goa trip', amount: 30000, date: (DateTime.now())),
Transaction(
id: 't2',
title: 'Karnataka trip',
amount: 20000,
date: DateTime.now(),
description: 'Beautiful trip'),
];

_addTranscation(String title, double amount, String description) {
//function
print(title);
print(amount);

    var tra = Transaction(
        //object of Transaction
        id: 't3',
        title: title,
        amount: amount,
        date: DateTime.now(),
        description: description);
    setState(() {
      transaction.add(tra);
    });
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Expence'),
),
body: Column(
children: [
Container(
margin: const EdgeInsets.all(20),
child: TextFormField(
controller: titleController,
cursorColor: Colors.brown,
keyboardType: TextInputType.name,
decoration: const InputDecoration(
labelText: "Title:",
),
),
),
Container(
margin: const EdgeInsets.all(20),
child: TextFormField(
controller: amountController,
cursorColor: Colors.brown,
keyboardType: TextInputType.number,
decoration: const InputDecoration(
labelText: "Amount:",
),
),
),
Container(
margin: const EdgeInsets.all(20),
child: TextFormField(
controller: descriptionController,
cursorColor: Colors.brown,
keyboardType: TextInputType.name,
decoration: const InputDecoration(
labelText: "Description:",
),
),
),
Center(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
style: ElevatedButton.styleFrom(primary: Colors.red),
onPressed: () {
_addTranscation(
titleController.text,
double.parse(amountController.text),
descriptionController.text);
},
child: const Text('Submit'),
),
],
),
),
const SizedBox(
height: 20,
),
Expanded(
child: ListView.builder(
itemCount: transaction.length, //variable
itemBuilder: (BuildContext context, int index) {
return Card(
elevation: 4,
child: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Text(transaction[index].id),
],
),
),
const SizedBox(
width: 20,
),
Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Text(transaction[index].title),
],
),
),

                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('${transaction[index].description}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(DateFormat('dd-MM-yyyy')
                                          .format(transaction[index].date)),
                                    ],
                                  ),
                                ),

                            const SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('${transaction[index].amount}'),
                                ],
                              ),
                            ),
                              ],
                            ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
}
}

transaction.dart


class Transaction{
final String id;
final String title;
final double amount;
final DateTime date;
final String? description; //lege to bhi chalega nhi lege to bhi chalega

Transaction({
required this.id,
required this.title,
required this.amount,
required this.date,
this.description,
});
}

