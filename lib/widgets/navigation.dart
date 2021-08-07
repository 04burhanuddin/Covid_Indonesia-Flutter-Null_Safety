part of 'widgets.dart';

class GoGlobalCases extends StatelessWidget {
  const GoGlobalCases({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 10,
          child: FloatingActionButton(
            backgroundColor: gradientStrt,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GlobalCasesPage()));
            },
            child: Icon(
              Icons.bubble_chart_rounded,
              size: 40.0,
            ),
          ),
        )
      ],
    );
  }
}
