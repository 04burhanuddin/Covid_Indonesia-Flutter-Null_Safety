part of 'widgets.dart';

// get local data indonesias
Future<DataIndonesia> getDataIndonesia() async {
  var dio = Dio();
  final response = await dio.get('https://api.kawalcorona.com/indonesia/');
  if (response.statusCode == 200) {
    return DataIndonesia.fromJson(
      response.data[0],
    );
  } else {
    throw Exception('Gagal mengambil data');
  }
}

class CardDataCovid extends StatelessWidget {
  const CardDataCovid({
    Key? key,
    required this.dataIndonesia,
    required this.textPeople,
  }) : super(key: key);

  final Future<DataIndonesia> dataIndonesia;
  final String textPeople;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 355,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 9,
        mainAxisSpacing: 9,
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
                SizedBox(height: 33),
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
                        fontSize: 12,
                        color: red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FutureBuilder<DataIndonesia>(
                      future: dataIndonesia,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Text(
                              snapshot.data!.positif,
                              style: positif,
                            ),
                          );
                        } else {
                          return CircularIndicator();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 33),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                    ),
                    Text(
                      "Active",
                      style: TextStyle(
                        fontSize: 12,
                        color: blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FutureBuilder<DataIndonesia>(
                      future: dataIndonesia,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              snapshot.data!.dirawat,
                              style: dirawat,
                            ),
                          );
                        } else {
                          return CircularIndicator();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 33),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                    ),
                    Text(
                      "Recovered",
                      style: TextStyle(
                        fontSize: 12,
                        color: green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FutureBuilder<DataIndonesia>(
                      future: dataIndonesia,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              snapshot.data!.sembuh,
                              style: sembuh,
                            ),
                          );
                        } else {
                          return CircularIndicator();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 33),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                    ),
                    Text(
                      "Death",
                      style: TextStyle(
                        fontSize: 12,
                        color: yellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FutureBuilder<DataIndonesia>(
                      future: dataIndonesia,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              snapshot.data!.meninggal,
                              style: meninggal,
                            ),
                          );
                        } else {
                          return CircularIndicator();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                PeopleCard(textPeople: textPeople),
              ],
            ),
            color: Colors.white,
          ),
          // end meninggal
        ],
      ),
    );
  }
}
