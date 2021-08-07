part of 'pages.dart';

Future<GlobalData> getDataGlobal() async {
  var dio = Dio();
  final response = await dio.get('https://api.kawalcorona.com/positif');
  print(response.data);
  if (response.statusCode == 200) {
    return GlobalData.fromJson(
      response.data,
    );
  } else {
    throw Exception('Gagal mengambil data');
  }
}

Future<GlobalData> getDataGlobalDeath() async {
  var dio = Dio();
  final response = await dio.get('https://api.kawalcorona.com/meninggal');
  print(response.data);
  if (response.statusCode == 200) {
    return GlobalData.fromJson(
      response.data,
    );
  } else {
    throw Exception('Gagal mengambil data');
  }
}

Future<GlobalData> getDataGlobalRecovered() async {
  var dio = Dio();
  final response = await dio.get('https://api.kawalcorona.com/sembuh');
  print(response.data);
  if (response.statusCode == 200) {
    return GlobalData.fromJson(
      response.data,
    );
  } else {
    throw Exception('Gagal mengambil data');
  }
}

class GlobalCasesPage extends StatefulWidget {
  const GlobalCasesPage({Key? key}) : super(key: key);

  @override
  _GlobalCasesPageState createState() => _GlobalCasesPageState();
}

class _GlobalCasesPageState extends State<GlobalCasesPage> {
  late Future<GlobalData> dataGlobal;
  late Future<GlobalData> dataGlobalMeninggal;
  late Future<GlobalData> dataGlobalSembuh;
  final String maps = 'assets/svg/maps.svg';

  @override
  void initState() {
    super.initState();
    dataGlobal = getDataGlobal();
    dataGlobalMeninggal = getDataGlobalDeath();
    dataGlobalSembuh = getDataGlobalRecovered();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF04141),
        title: Text("Global Cases"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 104),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SvgPicture.asset(maps),
          ),
          SizedBox(height: 115),
          CardPositif(dataGlobal: dataGlobal),
          CardDouble(
              dataGlobalMeninggal: dataGlobalMeninggal,
              dataGlobalSembuh: dataGlobalSembuh)
        ],
      ),
    );
  }
}

class CardDouble extends StatelessWidget {
  const CardDouble(
      {Key? key,
      required this.dataGlobalMeninggal,
      required this.dataGlobalSembuh})
      : super(key: key);
  final Future<GlobalData> dataGlobalMeninggal;
  final Future<GlobalData> dataGlobalSembuh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Container(
            height: 131,
            width: 189,
            child: Card(
              color: Color(0xFF1F801D),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("Total Recovered", style: textCardGlobal),
                        // CircularIndicator(),
                        SizedBox(height: 9),
                        Row(
                          children: [
                            FutureBuilder<GlobalData>(
                              future: dataGlobalSembuh,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 4,
                                    ),
                                    child: Text(
                                      snapshot.data!.value,
                                      style: textDataGlobal,
                                    ),
                                  );
                                } else {
                                  return CircularIndicator();
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 9),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.people_alt_sharp,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: Text(
                                textPeople,
                                style: textPeopleGlobal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 131,
            width: 189,
            child: Card(
              color: Color(0xFFDEC90F),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("Total Death", style: textCardGlobal),
                        // CircularIndicator(),
                        SizedBox(height: 9),
                        Row(
                          children: [
                            FutureBuilder<GlobalData>(
                              future: dataGlobalMeninggal,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 4,
                                    ),
                                    child: Text(
                                      snapshot.data!.value,
                                      style: textDataGlobal,
                                    ),
                                  );
                                } else {
                                  return CircularIndicator();
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 9),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.people_alt_sharp,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: Text(
                                textPeople,
                                style: textPeopleGlobal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardPositif extends StatelessWidget {
  const CardPositif({
    Key? key,
    required this.dataGlobal,
  }) : super(key: key);
  final Future<GlobalData> dataGlobal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      width: 382,
      child: Card(
        color: gradientStrt,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text("Total Positive", style: textCardGlobal),
                  // CircularIndicator(),
                  SizedBox(height: 9),
                  Row(
                    children: [
                      FutureBuilder<GlobalData>(
                        future: dataGlobal,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 4,
                              ),
                              child: Text(
                                snapshot.data!.value,
                                style: textDataGlobal,
                              ),
                            );
                          } else {
                            return CircularIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 9),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.people_alt_sharp,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          textPeople,
                          style: textPeopleGlobal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
