part of 'pages.dart';

class SplashScreen extends StatelessWidget {
  final String logo = 'assets/svg/logo.svg';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 330),
          SvgPicture.asset(logo, height: 125),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Coronavirus Global\n & Indonesia Live Data",
              style: textLogo,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 255,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Demo V.20.1\nMade With By Burhanuddin",
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
