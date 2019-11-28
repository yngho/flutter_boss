import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(top: 150),
        child: Text('Company'),
      ),
    );
  }
}