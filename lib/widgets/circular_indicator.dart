part of 'widgets.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        height: 15,
        width: 15,
        child: CircularProgressIndicator(
          backgroundColor: Colors.red,
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
