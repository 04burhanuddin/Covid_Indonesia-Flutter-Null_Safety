part of 'pages.dart';

class GlobalCasesPage extends StatefulWidget {
  const GlobalCasesPage({Key? key}) : super(key: key);

  @override
  _GlobalCasesPageState createState() => _GlobalCasesPageState();
}

class _GlobalCasesPageState extends State<GlobalCasesPage> {
  late Future<GlobalData> dataPositif, dataMeninggal, dataSembuh;

  @override
  void initState() {
    super.initState();
    dataPositif = globalPositif();
    dataMeninggal = globalDeath();
    dataSembuh = globalRecovered();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
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
          CardPositif(dataGlobal: dataPositif),
          CardDouble(
            dataGlobalMeninggal: dataMeninggal,
            dataGlobalSembuh: dataSembuh,
          ),
        ],
      ),
    );
  }
}
