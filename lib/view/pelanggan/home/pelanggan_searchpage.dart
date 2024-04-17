import 'package:flutter/material.dart';
import 'package:mr_garage/utils/global.colors.dart';

class PelangganSearchPage extends StatefulWidget {
  const PelangganSearchPage({super.key});

  @override
  _PelangganSearchState createState() => _PelangganSearchState();
}

class _PelangganSearchState extends State<PelangganSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: SafeArea(
        child: Center(
          child: Text('Pencarian'),
        ),
      ),
    );
  }
}
