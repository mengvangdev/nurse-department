import 'package:nurse_department/resource/resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileLayout(),
      tablet: TabletLayout(),
      laptop: LaptopLayout(),
      desktop: DesktopLayout(),
    );
  }
}
