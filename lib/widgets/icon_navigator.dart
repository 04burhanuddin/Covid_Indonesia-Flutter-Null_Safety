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
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(Icons.language_rounded, size: 30.0),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GlobalCasesPage()));
            },
          ),
        ),
      ],
    );
  }
}
