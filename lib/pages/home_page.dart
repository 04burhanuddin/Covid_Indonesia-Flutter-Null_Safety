part of 'pages.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
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
            colors: [white, red],
            begin: FractionalOffset(0.5, 0.5),
            end: FractionalOffset(0.5, 0.1),
            stops: [0.0, 0.0],
          ),
        ),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                GoGlobalCases(),
                SizedBox(height: 30),
                Tittle(),
                SizedBox(height: 15),
                CardDataCovid(
                  dataIndonesia: dataIndonesia,
                  textPeople: textPeople,
                ),
                SizedBox(height: 10),
                TitlePrevention(),
                SizedBox(height: 15),
                Pencegahan(),
                SizedBox(height: 18),
                MedicalHelp(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
