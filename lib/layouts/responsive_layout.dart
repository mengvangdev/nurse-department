import 'package:nurse_department/resource/resource.dart';
import 'dart:developer';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.laptop,
    required this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget laptop;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= Dimension.mobile) {
        log("mobile = ${constraints.maxWidth}");
        return mobile;
      } else if (constraints.maxWidth <= Dimension.tablet) {
        log("tablet = ${constraints.maxWidth}");
        return tablet;
      } else if (constraints.maxWidth <= Dimension.laptop) {
        log("laptop = ${constraints.maxWidth}");
        return laptop;
      } else {
        log("desktop = ${constraints.maxWidth}");
        return desktop;
      }
    });
  }
}
