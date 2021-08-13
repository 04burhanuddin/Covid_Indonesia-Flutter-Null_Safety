part of 'widgets.dart';

// get Global data poditive
Future<GlobalData> globalPositif() async {
  var dio = Dio();
  final response = await dio.get('https://api.kawalcorona.com/positif');
  if (response.statusCode == 200) {
    return GlobalData.fromJson(
      response.data,
    );
  } else {
    throw Exception('Gagal mengambil data');
  }
}

// get Global data recovered
Future<GlobalData> globalRecovered() async {
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

// get Global data death
Future<GlobalData> globalDeath() async {
  var dio = Dio();
  final response = await dio.get('https://api.kawalcorona.com/meninggal');
  if (response.statusCode == 200) {
    return GlobalData.fromJson(
      response.data,
    );
  } else {
    throw Exception('Gagal mengambil data');
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
              color: green,
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
                        SizedBox(height: 9),
                        Row(
                          children: [
                            FutureBuilder<GlobalData>(
                              future: dataGlobalSembuh,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 4),
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
                              padding: const EdgeInsets.only(left: 5),
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
              color: yellow,
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
                        SizedBox(height: 9),
                        Row(
                          children: [
                            FutureBuilder<GlobalData>(
                              future: dataGlobalMeninggal,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 4),
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
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                textPeople,
                                style: textPeopleGlobal,
                              ),
                            ),
                          ],
                        ),
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
        color: red,
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
                  SizedBox(height: 9),
                  Row(
                    children: [
                      FutureBuilder<GlobalData>(
                        future: dataGlobal,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 4),
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
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          textPeople,
                          style: textPeopleGlobal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
