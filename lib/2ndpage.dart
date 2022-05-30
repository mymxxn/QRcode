import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Secondpage extends StatefulWidget {
  final String? barcode;
  Secondpage({Key? key, required this.barcode}) : super(key: key);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  Barcode? barcode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text("${barcode?.code}")],
        ),
      ),
    );
  }
}
