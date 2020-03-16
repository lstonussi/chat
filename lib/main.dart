import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
//  //Retorna apenas um documento
//  DocumentSnapshot snapshot = await Firestore.instance.collection(
//      'mensagens').document('55u5Kw5e3NvGMywiBrnI').get();
//  print(snapshot.data);

//  //Retorna uma fotografia dos dados no momento em que foi disparado a função (Varios documentos).
//  QuerySnapshot snapshot =
//      await Firestore.instance.collection('mensagens').getDocuments();
//  snapshot.documents.forEach((d){
//    d.reference.updateData({'lido': false});
//  });

//  //Ler coleções
//  Firestore.instance.collection('mensagens').snapshots().listen((dado) {
//    dado.documents.forEach((d) {
//      print(d.data);
//    });
//  });

  Firestore.instance.collection('mensagens').document('55u5Kw5e3NvGMywiBrnI').snapshots().listen((dado){
    print(dado.data);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
