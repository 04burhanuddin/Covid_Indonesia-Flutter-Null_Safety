import 'package:flutter/material.dart';
import 'package:covid_indonesia/themes/themes.dart';

class Tittle extends StatelessWidget {
  const Tittle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Data Covid Indonesia",
        style: textndonesia,
      ),
    );
  }
}
