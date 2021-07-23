part of 'widgets.dart';

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
