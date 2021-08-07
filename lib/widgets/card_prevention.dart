part of 'widgets.dart';

class Pencegahan extends StatelessWidget {
  const Pencegahan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25, left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SvgPicture.asset(avoid),
              SizedBox(height: 5),
              Text(
                "Avoid",
                style: textPencegahan,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(symptompsAware),
              SizedBox(height: 5),
              Text(
                "Symptoms Aware",
                style: textPencegahan,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(disinfectan),
              SizedBox(height: 5),
              Text(
                "Disinfectan",
                style: textPencegahan,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(keepClean),
              SizedBox(height: 5),
              Text(
                "Keep Clean",
                style: textPencegahan,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
