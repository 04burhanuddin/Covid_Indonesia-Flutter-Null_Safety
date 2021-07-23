import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_indonesia/widgets/themes.dart';
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
  final String orang = "Orang";
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
                          "Data Indonesia",
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
                                        "Positif",
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
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          orang,
                                          style: textCard,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        "Dirawat",
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
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          orang,
                                          style: textCard,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        "Sembuh",
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
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          orang,
                                          style: textCard,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        "Meninggal",
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
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Text(
                                          orang,
                                          style: textCard,
                                        ),
                                      ),
                                    ],
                                  ),
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
                      child: CircularProgressIndicator(),
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

class Pencegahan extends StatelessWidget {
  // assets svg
  final String avoid = 'assets/svg/avoid.svg';
  final String disinfectan = 'assets/svg/disinfectan.svg';
  final String keepClean = 'assets/svg/keep_clean.svg';
  final String symptompsAware = 'assets/svg/symptoms_aware.svg';

  const Pencegahan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25, left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SvgPicture.asset(avoid),
              SizedBox(
                height: 5,
              ),
              Text(
                "Avoid",
                style: textPencegahan,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(symptompsAware),
              SizedBox(
                height: 5,
              ),
              Text(
                "Symptoms Aware",
                style: textPencegahan,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(disinfectan),
              SizedBox(
                height: 5,
              ),
              Text(
                "Disinfectan",
                style: textPencegahan,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(keepClean),
              SizedBox(
                height: 5,
              ),
              Text(
                "Keep Clean",
                style: textPencegahan,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MedicalHelp extends StatelessWidget {
  final String medical = 'assets/svg/medical.svg';
  final String virus = 'assets/svg/virus.svg';
  const MedicalHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 365,
        height: 136,
        child: Card(
          elevation: 2,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
              ),
              Column(
                children: [
                  SvgPicture.asset(medical),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        "Dial 119 For\nMedical Help!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Dial 119 For nMedical Help!",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  SvgPicture.asset(virus),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
