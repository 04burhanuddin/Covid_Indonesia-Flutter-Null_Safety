import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:covid_indonesia/themes/themes.dart';
import 'package:covid_indonesia/widgets/prevention.dart';
import 'package:covid_indonesia/widgets/people_card.dart';
import 'package:covid_indonesia/widgets/medical_help.dart';
import 'package:covid_indonesia/model/indonesia_cases.dart';

Future<DataIndonesia> getDataIndonesia() async {
  var dio = Dio();
  final response = await dio.get('https://api.kawalcorona.com/indonesia/');
  print(response.data);
  if (response.statusCode == 200) {
    return DataIndonesia.fromJson(
      response.data[0],
    );
  } else {
    throw Exception('Gagal mengambil data');
  }
}

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
            FutureBuilder<DataIndonesia>(
              future: dataIndonesia,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Text(
                          "Data Covid Indonesia",
                          style: textndonesia,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 355,
                        height: 355,
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(16),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: [
                            // Positif
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              elevation: 9,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 33,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                      ),
                                      Text(
                                        "Positive",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: textPositif,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          snapshot.data!.positif,
                                          style: positif,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  PeopleCard(textPeople: textPeople),
                                ],
                              ),
                              color: Colors.white,
                            ),
                            // end positif

                            // Dirawat
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              elevation: 9,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 33,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                      ),
                                      Text(
                                        "Active",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: textDirawat,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          snapshot.data!.dirawat,
                                          style: dirawat,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  PeopleCard(textPeople: textPeople),
                                ],
                              ),
                              color: Colors.white,
                            ),
                            // end dirawat

                            // Sembuh
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              elevation: 9,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 33,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                      ),
                                      Text(
                                        "Recovered",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: textSembuh,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          snapshot.data!.sembuh,
                                          style: sembuh,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  PeopleCard(textPeople: textPeople),
                                ],
                              ),
                              color: Colors.white,
                            ),
                            // end sembuh

                            // Meninggal
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              elevation: 9,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 33,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                      ),
                                      Text(
                                        "Death",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: textMeniggal,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          snapshot.data!.meninggal,
                                          style: meninggal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  PeopleCard(textPeople: textPeople),
                                ],
                              ),
                              color: Colors.white,
                            ),
                            // end meninggal
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                          ),
                          Text(
                            "Coronavirus Prevention",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Pencegahan(),
                      SizedBox(
                        height: 30,
                      ),
                      MedicalHelp(),
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(50),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
