import 'package:nurse_department/resource/resource.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
