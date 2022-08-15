import 'package:flutter/material.dart';
import 'package:meuapp/map.page.dart';
import './servicos/sp_trans.dart';

void main() async {
  runApp(const MyApp());
}

void test() async {
  SpTrans spTrans = SpTrans();
  await spTrans.autenticar();
  await spTrans.getLinhaSentido('8000', '2');
}

// ################ APP ##################

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MapPage(),
    );
  }
}
