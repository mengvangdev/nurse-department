import 'package:nurse_department/resource/resource.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
