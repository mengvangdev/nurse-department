import 'package:nurse_department/resource/resource.dart';
import 'dart:developer';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.responsive,
  });

  final Widget responsive;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= Dimension.mobile) {
        log("mobile = ${constraints.maxWidth}");
      } else if (constraints.maxWidth <= Dimension.tablet) {
        log("tablet = ${constraints.maxWidth}");
      } else if (constraints.maxWidth <= Dimension.laptop) {
        log("laptop = ${constraints.maxWidth}");
      }
      return responsive;
    });
  }
}
