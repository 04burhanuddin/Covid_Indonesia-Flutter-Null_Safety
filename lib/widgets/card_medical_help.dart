part of 'widgets.dart';

class MedicalHelp extends StatelessWidget {
  const MedicalHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 365,
        height: 120,
        child: Card(
          elevation: 2,
          child: Row(
            children: [
              Column(
                children: [
                  SvgPicture.asset(medical, height: 110),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Dial 119 For\nMedical Help!",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "if any symptoms appear",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SvgPicture.asset(virus),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(virus),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
