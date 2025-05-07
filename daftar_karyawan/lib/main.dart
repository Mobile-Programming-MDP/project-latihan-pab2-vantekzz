import 'dart:convert';

import 'package:daftar_karyawan/models/karyawan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black, secondary: Colors.cyan),
          useMaterial3: true,
      ),
      home: MyhomePage(),
    ):
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  Future<List<Karyawan>>  readjsonData() async {
    final String response = await rootBundle.loadString('assets/karyawan.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) = Karyawan.fromJson(json)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        tittle : const Text("Daftar Karyawan"),
      ),
      body: FutureBuilder<List<Karyawan>>(
        future: _readJsonDataconst {},
        builder: (context, snapshot)
        if(snapshot.hasData) {
          return ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              tittle : text(initialData: [snapshot.],)
            )
          })
        }
      )
    )
  }
}
