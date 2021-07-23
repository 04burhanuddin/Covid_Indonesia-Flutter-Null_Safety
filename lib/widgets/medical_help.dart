import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalHelp extends StatelessWidget {
  // assets svg
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
                        "Dial 119 For Medical Help!",
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
