part of 'widgets.dart';

class TitlePrevention extends StatelessWidget {
  const TitlePrevention({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
        ),
        Text(
          "Coronavirus Prevention",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
