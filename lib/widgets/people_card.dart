import 'package:covid_indonesia/themes/themes.dart';
import 'package:flutter/material.dart';

class PeopleCard extends StatelessWidget {
  const PeopleCard({
    Key? key,
    required this.textPeople,
  }) : super(key: key);

  final String textPeople;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Icon(
            Icons.people_alt_sharp,
            size: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 5,
          ),
          child: Text(
            textPeople,
            style: textCard,
          ),
        ),
      ],
    );
  }
}
