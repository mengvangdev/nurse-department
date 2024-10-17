import 'package:flutter/material.dart';
import 'package:nurse_department/layouts/laptop_layout.dart';
import 'package:nurse_department/layouts/responsive_layout.dart';
import 'package:nurse_department/layouts/mobile_layout.dart';
import 'package:nurse_department/layouts/tablet_layout.dart';
import 'package:nurse_department/layouts/desktop_layout.dart';

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
