import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataList = [];

  Future<void> fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        dataList = jsonDecode(response.body);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTTP Request - Maulana AlSyafei - 201011401402'),
        ),
        body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dataList[index]['title']),
            );
          },
        ),
      ),
    );
  }
}