import 'dart:async';
import 'package:flutter/material.dart';
import 'package:covid_indonesia/widgets/title.dart';
import 'package:covid_indonesia/themes/themes.dart';
import 'package:covid_indonesia/widgets/card_data.dart';
import 'package:covid_indonesia/widgets/prevention.dart';
import 'package:covid_indonesia/widgets/medical_help.dart';
import 'package:covid_indonesia/model/indonesia_cases.dart';
import 'package:covid_indonesia/widgets/title_prevention.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final String textPeople = "People";
  late Future<DataIndonesia> dataIndonesia;

  @override
  void initState() {
    super.initState();
    dataIndonesia = getDataIndonesia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientEnd, gradientStrt],
            begin: FractionalOffset(0.5, 0.5),
            end: FractionalOffset(0.5, 0.1),
            stops: [0.0, 0.0],
            // tileMode: TileMode.repeated,
          ),
        ),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Tittle(),
                SizedBox(
                  height: 15,
                ),
                CardDataCovid(
                    dataIndonesia: dataIndonesia, textPeople: textPeople),
                SizedBox(
                  height: 20,
                ),
                TitlePrevention(),
                SizedBox(
                  height: 15,
                ),
                Pencegahan(),
                SizedBox(
                  height: 30,
                ),
                MedicalHelp(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
